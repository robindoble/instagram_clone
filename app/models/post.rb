class Post < ActiveRecord::Base
	
	validates :user_id, presence: true

	has_attached_file :picture, 
	styles: { medium: "300x300>" },
	storage: :s3,
	s3_credentials: {
		bucket: 'instagram_robin_doble_clone',
		access_key_id: Rails.application.secrets.s3_access_key,
		secret_access_key: Rails.application.secrets.s3_secret_key
	}

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  # attr_reader :comment
  
  def comment
  	''
  end
  
  def create_comment(text)
  	new_comment = self.comments.create(comment: text, user: self.user)
  	new_comment.create_hashtags
  end

end
