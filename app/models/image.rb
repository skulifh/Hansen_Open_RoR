class Image < ActiveRecord::Base
	has_attached_file :photo,
		:styles => {:frontpage => ['500x500#'], :slider => ['1400x410#']},
		:path => ":rails_root/public/data/photos/images/:id/:basename_:style.:extension",
		:url => "/data/photos/images/:id/:basename_:style.:extension"
		#:path => ":rails_root/public/data/photos/1/subpage-banner.jpg",
		#:url => "/data/photos/1/subpage-banner.jpg"
	#validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	
	validates_attachment :photo,
    	:presence => true,
    	content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
