class Cat < ActiveRecord::Base
  # Child -- Foreign Key
  belongs_to :owner
end
