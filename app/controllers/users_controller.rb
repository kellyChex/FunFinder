 class UsersController < ApplicationController



	def show
  	    @user = User.find(params[:id])
  		@followings = Following.where(:user_id => current_user.id)
  		# @followers = User.find(@followings.follower_id)
  		@followed = []
  		@followings.each do |followed| 
  			@followed << followed.followed_id
  		end

  		@my_followeds = User.where(:id => @followed)



    	if @user != nil
    		@user = User.find(params[:id])
    	end
	end

   def follow
 	@user = User.find(params[:id])
  		@followings = Following.where(:user_id => current_user.id)


	if Following.where(:user_id => current_user.id, :followed_id => @user.id).blank? 
	  	@user = User.find(params[:id])

	   	@following = Following.new
	   	@following.followed_id = @user.id
	   	@following.user_id = current_user.id
	   	@following.save

   		render 'show.html.erb'
   	else
   		render 'show.html.erb'
	end
   end

	def unfollow
		@user = User.find(params[:id])
		@following = Following.where(:user_id => current_user.id, :followed_id => @user.id)
		Following.destroy(@following)

		render 'show.html.erb'
	end


end
