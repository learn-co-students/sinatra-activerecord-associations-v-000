class AddColumnToCats < ActiveRecord::Base
  def change
    add_column :cats, :owner_id, :integer
  end
end
