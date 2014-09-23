class TournamentsController < ApplicationController
	def index
		@tournaments = Tournament.find(:all, :order => "created_at desc")
	end

	def update
		tournament = Tournament.find(params[:id])
		#if has_access(blog,current_user)
			tournament.update_attributes(tournament_params)
			redirect_to blogs_path
		#else
		#	redirect_to blogs_path
		#end
	end

	def edit
		@tournament = Tournament.find(params[:id])
		#if !has_access(@blog, current_user)
			#redirect_to tournaments_path
		#end
	end

	def create
		@tournament = Tournament.new(tournament_params)
		if @tournament.save
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	private

	def tournament_params
		params.require(:tournament).permit(:name, :description, :photo, :galleries_tokens, :users_tokens)
	end
end
