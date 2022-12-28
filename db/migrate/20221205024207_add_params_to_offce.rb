class AddParamsToOffce < ActiveRecord::Migration[7.0]
  def change
    add_column :offices, :name, :string
    add_column :offices, :phone_number, :string
    add_column :offices, :address, :string
    add_column :offices, :verified, :boolean
  end
end
