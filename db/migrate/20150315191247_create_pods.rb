class CreatePods < ActiveRecord::Migration
  def change
    create_table :pods do |t|
      t.text :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :pods, :users
  end
end
