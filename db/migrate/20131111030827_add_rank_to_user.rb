class AddRankToUser < ActiveRecord::Migration
  def change
    add_column :users, :rank, :string
  end
end
