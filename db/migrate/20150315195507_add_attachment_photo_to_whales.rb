class AddAttachmentPhotoToWhales < ActiveRecord::Migration
  def self.up
    change_table :whales do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :whales, :photo
  end
end
