class AddColumnToColleague < ActiveRecord::Migration[5.2]
  def change
    add_column :colleagues, :details, :string
  end
end
