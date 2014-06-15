module ImageHelper
	def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def is_admin(user)
  	return user.admin
  end
end
