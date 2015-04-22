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

def home_away(vs)
  vs == 'at' ? 'away' : 'home'
end

def game_type(team, date)
  return 'conference' if team.include? '*'
  return 'exhibition' if team.include? '#'
  return 'tournament' if Date.strptime(date, '%m/%d/%y') > Date.parse('2015-03-15')
  'non-conference'
end

def home_score(outcome, kentucky_home, winning_score, losing_score)
  kentucky_home == 'home' && outcome == 'W' ? winning_score : losing_score
end

def away_score(outcome, kentucky_home, winning_score, losing_score)
  return winning_score if kentucky_home == 'away' && outcome == 'W'
  return losing_score if kentucky_home == 'home' && outcome == 'W'
  return winning_score if kentucky_home == 'home' && outcome == 'L'
  return losing_score if kentucky_home == 'away' && outcome == 'L'
end

games = []

doc.xpath('//tr[@class="event-listing"]').each_with_index do |element|
  # puts element
  row_element = element.css('td')

  # vs = 'at' or 'vs.'
  vs = row_element[1].text.split(' ')[0]
  # opponent
  opponent = row_element[1].text.split(' ')[1..-1].join(' ')
  # location
  # outcome
  outcome = row_element[3].text.split(',')[0] unless row_element[3].nil?
  location = row_element[2].text
  score = row_element[3].text.split(',')[1] unless row_element[3].nil?
  winning_score = score.split('-')[0].gsub(' ', '') unless score.nil?
  temp_losing_score = score.split('-')[1] unless score.nil?
  losing_score = temp_losing_score.split(' ')[0] unless score.nil? || temp_losing_score.split(' ')[1].nil?
  over_time =  score.split(' ')[1..-1].join('').to_s unless score.nil? || temp_losing_score.split(' ')[1].nil?
  date = row_element[0].text
  games.push(
    date: date,
    outcome: outcome,
    home_team: home_away(vs) == 'home' ? 'Kentucky' : opponent,
    away_team: home_away(vs) == 'away' ? 'Kentucky' : opponent,
    location: location,
    home_score: home_score(outcome, home_away(vs), winning_score, losing_score.nil? ? temp_losing_score : losing_score),
    away_score: away_score(outcome, home_away(vs), winning_score, losing_score.nil? ? temp_losing_score : losing_score),
    # winning_score: winning_score,
    game_type: game_type(opponent, date),
    # losing_score: losing_score.nil? ? temp_losing_score : losing_score,
    over_time: number_of_overtimes(over_time)
  )
end
puts JSON.pretty_generate(games)
