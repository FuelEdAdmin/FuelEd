class AddTypeToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :add_school_to_identities, :string
    add_column :identities, :type, :string
    add_column :identities, :school, :string
  end
end
