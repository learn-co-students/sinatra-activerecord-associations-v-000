class Owner < ActiveRecord::Base
  has_many :cats
  puts "hello"
end
