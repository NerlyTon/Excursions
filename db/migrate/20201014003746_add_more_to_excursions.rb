class AddMoreToExcursions < ActiveRecord::Migration[6.0]
  def change
    add_column :excursions, :pick_up, :time
    add_column :excursions, :drop_off, :time
    add_column :excursions, :veh_num, :integer
  end
end
