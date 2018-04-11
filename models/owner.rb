class Owner < ActiveRecord::Base
  has_many :cats # Whenever we use a has_many we also have to use the belongs_to
end
