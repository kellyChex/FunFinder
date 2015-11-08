class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, profile_attributes: [:name, :bio] )
  end

  def account_update_params
        params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
