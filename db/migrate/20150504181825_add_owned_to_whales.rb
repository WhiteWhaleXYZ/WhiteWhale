class AddOwnedToWhales < ActiveRecord::Migration
  def change
    add_column :whales, :owned, :boolean, default: false
  end
end
