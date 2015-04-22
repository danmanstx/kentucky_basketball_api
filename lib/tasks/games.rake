require 'open-uri'
require 'nokogiri'
require 'json'

namespace :games do
  desc 'Scrap and insert single years worth of game information'
  task :init, [:year] => [:environment] do |t, args|
    year = args[:year] || 2015
    games = fetch_games(year)
    # games.each do |game|
    #   Game.create(game)
    # end
  end

  desc 'clear out box scores'
  task clear_box_scores: :environment do
    Game.destroy_all
  end

  desc 'Run all bootstrapping tasks'
  task all: [:init, :default_comment]
end

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

def fetch_games(year, exhibition = false)
  doc = Nokogiri::HTML(open('http://www.ukathletics.com/sports/m-baskbl/sched/kty-m-baskbl-sched.html'))

  # games = []
  teams = Team.where("year=?", year)
  puts teams.inspect

  doc.xpath('//tr[@class="event-listing"]').each_with_index do |element, index|
    # puts element
    row_element = element.css('td')

    # vs = 'at' or 'vs.'
    vs = row_element[1].text.split(' ')[0]
    # opponent
    # opponent = row_element[1].text.split(' ')[1..-1].join(' ').sub(/(\s\*)|(\s\#)/, '')
    opponent = row_element[1].text.split(' ')[1..-1].join(' ')
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
      date: date,
      home_team_id: Team.select(:id).where("year=? and  ", year).first,
      away_team_id: Team.select(:id).where("year=? and ", year).first,
      location: location,
      opponent: opponent,
      winning_score: winning_score,
      losing_score: losing_score.nil? ? temp_losing_score : losing_score,
      over_time: number_of_overtimes(over_time)
    )
  end
end
