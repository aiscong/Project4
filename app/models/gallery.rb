class Gallery < ActiveRecord::Base
	validates :user_id, presence: true
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 40 }
	has_many :paintings, dependent: :destroy
	def feed
    paintings
  	end

end
