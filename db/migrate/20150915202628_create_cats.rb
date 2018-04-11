class CreateCats < ActiveRecord::Migration[4.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :breed
    end
  end
end

#   def up
#     create_table :cats do |t|
#       t.string :name
#       t.integer :age
#       t.string :breed
#     end
#   end
#
#   def down
#     drop_table :cats
#   end
# end
