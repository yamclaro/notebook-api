class AddKIndToContact < ActiveRecord::Migration[7.1]
  def change
    add_reference :contacts, :kind, foreign_key: true
  end
end
