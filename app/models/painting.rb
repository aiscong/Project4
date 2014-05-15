class Painting < ActiveRecord::Base
	validates :gallery_id, presence: true
	validates :user_id, presence: true
	validates :name, presence: true,  length: { maximum: 40 }
	belongs_to :gallery
	belongs_to :user
	mount_uploader :image, ImageUploader
	validates :image, presence: true
	default_scope -> { order('created_at DESC') }
	# Returns paintings from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
