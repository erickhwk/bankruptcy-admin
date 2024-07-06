class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :legal_name
      t.string :cnpj

      t.timestamps
    end
  end
end
