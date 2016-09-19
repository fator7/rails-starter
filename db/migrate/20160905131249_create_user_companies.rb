class CreateUserCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :users_companies do |t|
      t.references :user, foreign_key: true, null: false
      t.references :company, foreign_key: true, null: false

      t.timestamps
    end
  end
end
