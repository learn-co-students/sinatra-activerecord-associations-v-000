class Cat < ActiveRecord::Base
  belongs_to :owner
  # belongs_to always has the foreign key
end
