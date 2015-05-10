class Whale < ActiveRecord::Base
	belongs_to :pod
	has_attached_file :photo, :styles => { :medium => "300x300#", :thumb => "150x150#" }, :default_url => "DefaultWhale.png"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/



	amoeba do
		enable


		nullify :photo_file_name
		nullify :photo_content_type
		nullify :photo_file_size
		nullify :photo_updated_at

		customize(lambda { |orig_obj,copy_of_obj|

			copy_of_obj.photo = orig_obj.photo
			copy_of_obj.owned = false
		})
  end

  searchable do
    text :name, :description
  end
end
