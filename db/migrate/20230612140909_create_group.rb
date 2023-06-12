class CreateGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :user, null: false, foreign_key: true
      t.text :name
      t.text :icon
      t.timestamps
    end
  end
end
