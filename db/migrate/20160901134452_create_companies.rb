class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.citext :subdomain, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :companies, :subdomain, unique: true
  end
end
