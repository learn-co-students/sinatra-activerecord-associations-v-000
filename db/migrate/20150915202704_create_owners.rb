class CreateOwners < ActiveRecord::Migration[4.2]
  def change
    create_table :owners do |t|
      t.string :name
    end
  end
end

#   def up
#     create_table :owners do |t|
#       t.string :name
#     end
#   end
#
#   def down
#     drop_table :owners
#   end
# end
