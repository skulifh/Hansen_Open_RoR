class UserController < ApplicationController
	def create
		hashed_pw = Digest::SHA1.hexdigest(user_params[:password])
	  	@user = User.new(user_params)
	  	@user.password = hashed_pw
	    @user.admin = false

	    if @user.save
	      redirect_to root_path
	    else
	      render 'new'
	    end

  	#@user.save!
  	#redirect_to users_path()
  end

  private

  def user_params
  	params.require(:user).permit(:username, :fullname, :password, :email, :admin)
  end
end
