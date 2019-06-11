class SessionsController < Devise::SessionsController
	def create
    if env["omniauth.auth"].present?
      @user, message = User.authenticate_social_login(env["omniauth.auth"])
      if @user.present? && @user.persisted?
        sign_in_and_redirect @user
      else
        redirect_to root_path
      end
    end
  end
end
