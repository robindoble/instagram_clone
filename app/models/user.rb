class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :username, uniqueness: true, presence: true

	has_many :posts, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy

	has_many :following, :through => :relationships, :source => "followed_id"

	has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy


end
