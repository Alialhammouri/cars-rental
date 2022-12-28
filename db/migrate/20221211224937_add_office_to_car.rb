class AddOfficeToCar < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :office, null: false, foreign_key: true
  end
end
