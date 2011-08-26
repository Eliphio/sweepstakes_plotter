class User::Profile < EnumerateIt::Base
  associate_values :admin   => 1,
                   :gambler => 2,
                   :guest   => 3
end
