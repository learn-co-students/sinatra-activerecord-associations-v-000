class Owner < ActiveRecord::Base
  has_many :cats # belongs to Owner
end
