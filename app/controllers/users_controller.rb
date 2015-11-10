 class UsersController < ApplicationController


  def show

  	    @user = User.find(params[:id])


    	if @user != nil
    		@user = User.find(params[:id])
    	end


    	

   end
end
