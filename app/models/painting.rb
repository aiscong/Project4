class Painting < ActiveRecord::Base
	validates :gallery_id, presence: true
	validates :name,  uniqueness: { case_sensitive: false }, presence: true,  length: { maximum: 40 }
	belongs_to :gallery
	mount_uploader :image, ImageUploader
	validates :image, presence: true
	default_scope -> { order('created_at DESC') }
end
