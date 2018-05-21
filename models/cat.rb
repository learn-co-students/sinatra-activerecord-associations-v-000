class Cat < ActiveRecord::Base

  # Whenever we use a has_many we also have to use the belongs_to (and vice-versa) in the other model.
  belongs_to :owner
end
