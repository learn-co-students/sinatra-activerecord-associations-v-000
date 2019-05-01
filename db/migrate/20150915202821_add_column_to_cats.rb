class AddColumnToCats < ActiveRecord::Migration[5.2]
  def up
    add_column :cats, :owner_id, :integer
  end

  def down
    remove_column :cats, :owner_id
  end
end
