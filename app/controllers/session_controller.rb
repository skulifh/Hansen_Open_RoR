class SessionController < ApplicationController
	include SessionHelper
	def new
	end

	def create
			user = User.find_by(username: params[:session][:username])
		    if user && user.password == params[:session][:password]
		     	sign_in user
        		redirect_to root_path()
		    else
		      flash.now[:error] = 'Invalid email/password combination'
		      render 'new'
		    end
	end

	def destroy
     	sign_out
 		redirect_to root_url
 	end
end
