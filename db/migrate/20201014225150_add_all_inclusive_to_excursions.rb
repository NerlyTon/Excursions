class AddAllInclusiveToExcursions < ActiveRecord::Migration[6.0]
  def change
    add_column :excursions, :all_inclusive, :boolean, default: false
  end
end
