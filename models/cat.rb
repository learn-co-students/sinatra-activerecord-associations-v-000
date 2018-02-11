class Cat < ActiveRecord::Base
  belongs_to :owner
  #model with the belongs_to association also has the foreign key
end