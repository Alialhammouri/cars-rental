class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :car_plate_number
      t.string :manufacturer
      t.string :model
      t.string :manufacture_year
      t.string :color
      t.string :renting_price
      t.boolean :available

      t.timestamps
    end
  end
end
