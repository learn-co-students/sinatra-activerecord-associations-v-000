class Cat < ActiveRecord::Base
  belongs_to :owner # Whenever we use a has_many we also have to use the belongs_to, model with the belongs_to association also has the foreign key
end
