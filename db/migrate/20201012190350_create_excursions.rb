class CreateExcursions < ActiveRecord::Migration[6.0]
  def change
    create_table :excursions do |t|
      t.string :company
      t.string :location
      t.integer :price
      t.string :included
      t.string :what_to_bring
      t.text :description

      t.timestamps
    end
  end
end
