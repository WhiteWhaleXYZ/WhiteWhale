class Pod < ActiveRecord::Base
  belongs_to :user
  has_many :whales ,dependent: :destroy
  acts_as_taggable_on :tags
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "150x150>" }, :default_url => "DefaultPod.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  amoeba do
    enable

    puts "I was here"
    nullify :photo_file_name
    nullify :photo_content_type
    nullify :photo_file_size
    nullify :photo_updated_at

    customize(lambda { |orig_obj,copy_of_obj|
        puts "and here"
        copy_of_obj.photo = orig_obj.photo
    })



  end
end
