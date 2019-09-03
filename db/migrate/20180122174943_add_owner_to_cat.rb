class AddOwnerToCat < ActiveRecord::Migration
  def change
    add_column :cats, :owner_id, :integer
  end
end
