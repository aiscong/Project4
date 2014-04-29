class Gallery < ActiveRecord::Base
	validates :user_id, presence: true
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 40 }
end
