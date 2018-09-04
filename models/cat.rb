class Cat < ActiveRecord::Base
  belongs_to :owner #tells the database who this belongs_to
end