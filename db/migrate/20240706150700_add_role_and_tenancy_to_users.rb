class AddRoleAndTenancyToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :integer
    add_reference :users, :tenancy, foreign_key: true
  end
end
