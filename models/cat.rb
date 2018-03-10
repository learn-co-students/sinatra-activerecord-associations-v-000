class Cat < ActiveRecord::Base
  belongs_to :owner
end

# the model with the belongs_to association also has to have the foreign key