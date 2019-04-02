class CreateCat < ActiveRecord::Base
  def change
    create_table :cats do |t|

    t.string :name
    t.integer :age
    t.string :breed
        end
    end



  belongs_to :owner
end
