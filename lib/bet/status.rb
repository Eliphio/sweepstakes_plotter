class Bet::Status < EnumerateIt::Base
  associate_values :open => 1,
                   :sent => 2,
                   :paid => 3
end
