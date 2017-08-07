class Cat < ActiveRecord::Base
  #the model with the belongs_to method, also has the foreign key
  belongs_to :owner
end
