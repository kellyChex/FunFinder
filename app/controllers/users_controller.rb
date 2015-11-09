 class UsersController < ApplicationController

  def profile
       if @user != nil
         @user = User.find(params[:id])
      end
   end
end
