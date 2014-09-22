class User < ActiveRecord::Base
	has_and_belongs_to_many :tournaments
	before_create :create_remember_token
	has_attached_file :photo,
		:styles => {:frontpage => ['700x700#']},
		:path => ":rails_root/public/data/photos/users/:id/:basename_:style.:extension",
		:url => "/data/photos/users/:id/:basename_:style.:extension"
		#:path => ":rails_root/public/data/photos/1/subpage-banner.jpg",
		#:url => "/data/photos/1/subpage-banner.jpg"
	#validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	
	validates_attachment :photo,
    	#:presence => true,
    	content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	def create_remember_token
		self.remember_token = User.hash(User.new_remember_token)
	end
end
