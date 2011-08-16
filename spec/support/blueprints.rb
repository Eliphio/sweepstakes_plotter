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
