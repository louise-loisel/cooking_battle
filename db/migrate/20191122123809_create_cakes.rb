class CreateCakes < ActiveRecord::Migration[5.2]
  def change
    create_table :cakes do |t|
      t.string :name
      t.boolean :selectioned

      t.timestamps
    end
  end
end
