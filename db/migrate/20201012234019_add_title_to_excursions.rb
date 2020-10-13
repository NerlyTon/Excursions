class AddTitleToExcursions < ActiveRecord::Migration[6.0]
  def change
    add_column :excursions, :title, :string
  end
end
