module GalleryHelper
	def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def has_access(gallery, user)
  	if (gallery.user_id == user.id) || (is_admin(user))
  		return true
  	else
  		return false
  	end
  end

  def is_admin(user)
  	return user.admin
  end
end
