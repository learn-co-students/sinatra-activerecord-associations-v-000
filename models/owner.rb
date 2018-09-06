class Owner < ActiveRecord::Base
  # Parent -- Primary Key
  has_many :cats
end
