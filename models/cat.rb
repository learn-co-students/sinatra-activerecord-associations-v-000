class Cat < ActiveRecord::Base
  # The model with the belongs_to association also has the foreign key.
  belongs_to :owner
end
