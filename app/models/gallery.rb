class Gallery < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :blogs
	has_and_belongs_to_many :tournaments
	has_attached_file :photo,
		:styles => {:preview => ['700x400#'], :frontpage => ['700x400#']},
		:path => ":rails_root/public/data/photos/galleries/:id/:basename_:style.:extension",
		:url => "/data/photos/galleries/:id/:basename_:style.:extension"
		#:path => ":rails_root/public/data/photos/1/subpage-banner.jpg",
		#:url => "/data/photos/1/subpage-banner.jpg"
	#validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	
	validates_attachment :photo,
    	:presence => true,
    	content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
