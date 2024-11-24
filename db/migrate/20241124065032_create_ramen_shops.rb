class CreateRamenShops < ActiveRecord::Migration[7.1]
  def change
    create_table :ramen_shops do |t|
      t.string :name

      t.timestamps
    end
  end
end