class CreateColleagues < ActiveRecord::Migration[5.2]
  def change
    create_table :colleagues do |t|
      t.string :name
      t.string :pastry
      t.boolean :selectioned

      t.timestamps
    end
  end
end
