class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid  #for omniauth authentication
      t.string :provider #for omniauth authentication
      t.string :email

      t.timestamps
    end
  end
end
