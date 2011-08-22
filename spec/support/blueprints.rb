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

Championship.blueprint do
  name                 { 'Union of European Football Associations' }
  started_on           { Date.tomorrow }
  ended_on             { Date.yesterday.next_month }
end
