class Addcolumn2 < ActiveRecord::Migration
  def change
    add_column :cats, :owner_id, :integer
  end
end
