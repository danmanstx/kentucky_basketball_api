require 'open-uri'
require 'nokogiri'
require 'json'

doc = Nokogiri::HTML(open('http://www.ukathletics.com/sports/m-baskbl/sched/kty-m-baskbl-sched.html'))

def number_of_overtimes(over_time)
  return 1 if over_time == '(ot)'
  return 2 if over_time == '(2ot)'
  return 3 if over_time == '(3ot)'
  0
end

def seperate_date(date)
  date.split('/')
end

def home_away(vs)
  vs == 'at' ? 'away' : 'home'
end

games = []

doc.xpath('//tr[@class="event-listing"]').each_with_index do |element, index|
  # puts element
  row_element = element.css('td')

  # vs = 'at' or 'vs.'
  vs = row_element[1].text.split(' ')[0]
  # opponent
  opponent = row_element[1].text.split(' ')[1..-1].join(' ').sub(/(\s\*)|(\s\#)/, '')
  # location
  location = row_element[2].text
  # outcome
  outcome = row_element[3].text.split(',')[0] unless row_element[3].nil?
  score = row_element[3].text.split(',')[1] unless row_element[3].nil?
  winning_score = score.split('-')[0].gsub(' ', '') unless score.nil?
  temp_losing_score = score.split('-')[1] unless score.nil?
  losing_score = temp_losing_score.split(' ')[0] unless score.nil? || temp_losing_score.split(' ')[1].nil?
  over_time =  score.split(' ')[1..-1].join('').to_s unless score.nil? || temp_losing_score.split(' ')[1].nil?
  date = seperate_date(row_element[0].text)
  games.push(
    game: index + 1,
    month: date[0],
    day: date[1],
    year: date[2],
    home_away: home_away(vs),
    location: location,
    opponent: opponent,
    outcome: outcome,
    winning_score: winning_score,
    losing_score: losing_score.nil? ? temp_losing_score : losing_score,
    over_time: number_of_overtimes(over_time)
  )
end
puts JSON.pretty_generate(games)
