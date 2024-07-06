class CreateLawsuits < ActiveRecord::Migration[7.1]
  def change
    create_table :lawsuits do |t|
      t.references :tenancy, null: false, foreign_key: true
      t.string :alias

      t.timestamps
    end
  end
end
