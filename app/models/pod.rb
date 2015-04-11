class Pod < ActiveRecord::Base
  belongs_to :user
  has_many :whales ,dependent: :destroy
  acts_as_taggable_on :tags
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "150x150>" }, :default_url => "DefaultPod.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    
end
