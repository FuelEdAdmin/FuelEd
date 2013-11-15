class AddAddressInfoToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :country, :string
    add_column :schools, :state, :string
    add_column :schools, :county, :string
    add_column :schools, :city, :string
    add_column :schools, :address, :string
    add_column :schools, :zipcode, :string
  end
end
