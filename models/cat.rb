class Cat < ActiveRecord::Base
  belongs_to :owner
  # always has the foreign key column in db
end
