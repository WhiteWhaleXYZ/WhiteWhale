class CreateWhales < ActiveRecord::Migration
  def change
    create_table :whales do |t|
      t.text :name
      t.text :description
      t.references :pod, index: true

      t.timestamps null: false
    end
    add_foreign_key :whales, :pods
  end
end
