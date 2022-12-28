class AddParamsToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :phone_number, :string
    add_column :customers, :address, :string
    add_column :customers, :national_id, :integer
    add_column :customers, :birth_date, :date
    add_column :customers, :verified, :boolean
  end
end
