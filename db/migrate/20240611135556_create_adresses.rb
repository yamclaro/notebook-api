class CreateAdresses < ActiveRecord::Migration[7.1]
  def change
    create_table :adresses do |t|
      t.string :sreet
      t.string :city
      t.string :string
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
