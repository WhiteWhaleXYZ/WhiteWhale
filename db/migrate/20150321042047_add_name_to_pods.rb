class AddNameToPods < ActiveRecord::Migration
  def change
    add_column :pods, :name, :string
  end
end
