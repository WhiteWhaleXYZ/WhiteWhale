class Whale < ActiveRecord::Base
  belongs_to :pod
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "150x150>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
