class AddAttachmentPhotoToPods < ActiveRecord::Migration
  def self.up
    change_table :pods do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :pods, :photo
  end
end
