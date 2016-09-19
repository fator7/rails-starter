class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.citext :name, null: false
      t.jsonb :permissions
      t.references :company, foreign_key: true, null: false

      t.timestamps
    end
    add_index  :roles, :permissions, using: :gin
    # Make sure we don't have 2 `Admin` roles in the same company
    add_index  :roles, [:name, :company_id], unique: true
  end
end
