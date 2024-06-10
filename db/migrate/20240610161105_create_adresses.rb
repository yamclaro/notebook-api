class CreateAdresses < ActiveRecord::Migration[7.1]
  def change
    create_table :adresses do |t|
      t.string :street
      t.string :city
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
