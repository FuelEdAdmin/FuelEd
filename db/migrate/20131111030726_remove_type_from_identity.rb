class RemoveTypeFromIdentity < ActiveRecord::Migration
  def change
    remove_column :identities, :type, :string
  end
end
