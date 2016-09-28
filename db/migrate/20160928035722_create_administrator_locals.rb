class CreateAdministratorLocals < ActiveRecord::Migration
  def change
    create_table :administrator_locals do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :local, index: true, foreign_key: true
      t.string :estado, limit: 1

      t.timestamps null: false
    end
  end
end
