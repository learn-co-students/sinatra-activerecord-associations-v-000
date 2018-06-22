class Cat < ActiveRecord::Base
  belongs_to :owner

  puts "I am a cat"
end
