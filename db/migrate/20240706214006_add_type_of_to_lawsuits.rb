class AddTypeOfToLawsuits < ActiveRecord::Migration[7.1]
  def change
    add_column :lawsuits, :type_of, :string
  end
end
