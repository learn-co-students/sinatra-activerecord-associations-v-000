class Owner < ActiveRecord::Base
  has_many :cat

  def final
  end
end
