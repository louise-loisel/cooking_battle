class AddDetailsToColleagues < ActiveRecord::Migration[5.2]
  def change
    add_column :colleagues, :cake_id, :string
  end
end
