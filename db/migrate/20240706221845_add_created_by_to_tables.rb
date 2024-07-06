class AddCreatedByToTables < ActiveRecord::Migration[7.1]
  def change
    add_column :lawsuits, :created_by, :integer
    add_column :companies, :created_by, :integer
    add_column :reports, :created_by, :integer
  end
end
