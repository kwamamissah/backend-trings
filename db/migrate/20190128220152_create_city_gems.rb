class CreateCityGems < ActiveRecord::Migration[5.2]
  def change
    create_table :city_gems do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :img_url
      t.integer :category_id
      t.string :hours

      t.timestamps
    end
  end
end
