class UserController < ApplicationController
	include UserHelper
	def index
		@users = User.where("fullname like ?", "%#{params[:q]}%").order("created_at desc")
	    respond_to do |format|
	      format.html
	      format.json { render :json => @users }
	    end
	end

	def create
		if current_user && is_admin(current_user)
			hashed_pw = Digest::SHA1.hexdigest("123")
		  	@user = User.new(user_params)
		  	@user.password = hashed_pw
		    @user.admin = false

		    if @user.save
		      redirect_to root_path
		    else
		      render 'new'
		    end
		else
			redirect_to root_path
		end

  	#@user.save!
  	#redirect_to users_path()
  end

  def admin
  	if current_user && is_admin(current_user)
  		@users = User.all(:order => "fullname ASC")
  		@images = Image.all()
  	else
  		redirect_to root_path
  	end
  end

  def update
  	if current_user
	  	user = User.find(params[:id])
	  	if !user_params[:password].empty?
	  		hashed_pw = Digest::SHA1.hexdigest(user_params[:password])
		  	#user_params[:password] = hashed_pw
			user.password = hashed_pw
		end
		if !user_params[:photo].nil?
			user.photo = user_params[:photo]
		end
		user.description = user_params[:description]

		user.save!
		redirect_to root_path
	else
		redirect_to root_path
	end
  end

  def edit
  	if current_user
		@user = User.find(params[:id])
	else
		redirect_to root_path
	end
		
	end

  def add_admin
  	if current_user && is_admin(current_user)
	  	user = User.find(params[:user_id])
	  	user.admin = true
	  	user.save!
	  	redirect_to admin_path
	  else
	  	redirect_to root_path
	  end
  end

  def remove_admin
  	if current_user && is_admin(current_user)
	  	user = User.find(params[:user_id])
	  	user.admin = false
	  	user.save!
	  	redirect_to admin_path
	  else
	  	redirect_to root_path
	  end
  end

  private

  def user_params
  	params.require(:user).permit(:username, :fullname, :password, :email, :admin, :photo, :description, :sign_in_counter)
  end
end
