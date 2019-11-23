class AddColumnToCake < ActiveRecord::Migration[5.2]
  def change
    add_column :cakes, :details, :string
  end
end
