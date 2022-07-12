class SessionsController < Devise::SessionsController
	def create
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[params[:provider].to_sym]
    if request.env["omniauth.auth"].present?
      @user, message = User.authenticate_social_login(request.env["omniauth.auth"])
      if @user.present? && @user.persisted?
        sign_in_and_redirect @user
      else
        redirect_to root_path
      end
    end
  end
end
