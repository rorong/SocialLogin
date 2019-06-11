Rails.application.routes.draw do

  root to: 'homes#dashboard'

  devise_for :users
  devise_scope :user do
		get 'googlelogin', to: redirect('/auth/google_oauth2'), as: 'googlelogin'
    get 'facebooklogin', to: redirect('/auth/facebook'), as: 'facebooklogin'
    get 'linkedinlogin', to: redirect('/auth/linkedin'), as: 'linkedinlogin'
    get 'instagramlogin', to: redirect('/auth/instagram'), as: 'instagramlogin'

	  get 'auth/:provider/callback', to: 'sessions#create'
	  get 'auth/failure', to: redirect('/')
  end
end
