class CreateCats < ActiveRecord::Migration
  def up
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :breed
    end
  end
  3.5
  def down
    drop_table :cats
  end
end
