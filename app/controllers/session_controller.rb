class SessionController < ApplicationController
	include SessionHelper
	def new
	end

	def create
			hashed_pw = Digest::SHA1.hexdigest(params[:session][:password])
			user = User.find_by(username: params[:session][:username])
		    if user && user.password == hashed_pw
		     	sign_in user
		     	user.sign_in_counter += 1
		     	user.save!
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
