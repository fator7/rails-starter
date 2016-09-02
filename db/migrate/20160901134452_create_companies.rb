class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :subdomain
      t.string :name

      t.timestamps
    end
    add_index :companies, :subdomain, unique: true
  end
end
