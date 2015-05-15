class Whale < ActiveRecord::Base
	#defines attributes for whale
	belongs_to :pod

	#allows photos to be attached using paperclip and sets default image and sizing
	has_attached_file :photo, :styles => { :medium => "300x300#", :thumb => "150x150#" }, :default_url => "DefaultWhale.png"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


  #allows for deep copy of whales in forking process
  	amoeba do
		amoeba do
			enable
	
			 #clears fields of old info
			nullify :photo_file_name
			nullify :photo_content_type
			nullify :photo_file_size
			nullify :photo_updated_at
	
			#helps with copying paperclip images
			customize(lambda { |orig_obj,copy_of_obj|
	
				copy_of_obj.photo = orig_obj.photo
				copy_of_obj.owned = false
			})
  	end
	
  	#defines what is searchable for whale
  	searchable do
  	  text :name, :description
  	end
end
