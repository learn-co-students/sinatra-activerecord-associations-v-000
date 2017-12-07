class CreateCats < ActiveRecord::Migration[4.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :breed
    end
  end
end
