class AddImageUrlToExcursions < ActiveRecord::Migration[6.0]
  def change
    add_column :excursions, :image_url, :string
  end
end
