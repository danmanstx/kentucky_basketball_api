require 'open-uri'
require 'nokogiri'
require 'json'
require 'pp'

namespace :box_scores do
  desc 'Scrap and insert single year boxscore information'
  task :init, [:year] => [:environment] do |t, args|
    year = args[:year] || 2015
    box_scores = fetch_box_scores(year)
    box_scores.each do |box|
      BoxScore.create(box)
    end
  end

  desc 'clear out box scores'
  task clear_box_scores: :environment do
    BoxScore.destroy_all
  end

  desc 'Run all bootstrapping tasks'
  task all: [:default_user, :default_comment]
end

def seperate_date(date)
  date.split('/')
end

def game_list
  schedule = Nokogiri::HTML(open('http://www.ukathletics.com/sports/m-baskbl/sched/kty-m-baskbl-sched.html'))

  game_list = []

  schedule.xpath('//tr[@class="event-listing"]').each_with_index do |element, index|
    row_element = element.css('td')

    opponent = row_element[1].text.split(' ')[1..-1].join(' ')
    date = seperate_date(row_element[0].text)
    game_list.push(
      game: index + 1,
      month: date[0],
      day: date[1],
      year: date[2],
      opponent: opponent,
      exhibition: opponent.include?('#')
    )
  end
  game_list
end

def fetch_box_scores(year, exhibition = false)
  box_scores = []

  games = game_list
  games.delete_if { |game| game[:exhibition] == true } unless exhibition

  games.each do |game|
    date = game[:month] + game[:day]
    box_score_page = Nokogiri::HTML(open("http://www.ukathletics.com/sports/m-baskbl/stats/#{(year.to_i-1).to_s}-#{year}/uk#{date}.html"))
    box_score =  box_score_page.css('#story-container').first.text
    spilt_box_score =  box_score.split("\n\r\n\r\n\r\n").collect(&:strip).compact.reject { |element| element !~ /[^[:space:]]/ }
    box_scores.push(
      full_game: spilt_box_score[3],
      play_by_play: spilt_box_score[4],
      first_half: spilt_box_score[5],
      second_half: spilt_box_score[6],
      newspaper: spilt_box_score[7],
      play_analysis: spilt_box_score[8]
      )
  end
  box_scores
end
