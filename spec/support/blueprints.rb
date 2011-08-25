# encoding: utf-8
require 'machinist/caching/active_record'

User.blueprint do
 nickname              { 'salim' }
 email                 { 'salim@Turkish.net' }
 password              { '123456' }
 password_confirmation { '123456' }
end

Team.blueprint do
  name                 { 'Bilbao Vizcaya F. C.' }
end

Team.blueprint(:manchester) do
  name                 { 'Manchester United F. C.' }
end

Championship.blueprint do
  name                 { 'Union of European Football Associations' }
  started_on           { Date.tomorrow }
  ended_on             { Date.yesterday.next_month }
end

Round.blueprint do
  championship
  name                 { "1º Round" }
end

Game.blueprint do
  round
  team_1               { Team.make! }
  team_2               { Team.make!(:manchester) }
  game_day             { Date.today.next_month }
  game_time            { Time.now }
end

Bet.blueprint do
  user
  round
  status               { Bet::Status::OPEN }
end

Hunch.blueprint do
  bet
  game
end