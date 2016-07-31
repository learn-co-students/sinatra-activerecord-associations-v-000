class Cat < ActiveRecord::Base
  belongs_to :owner
  def final
  end
end
