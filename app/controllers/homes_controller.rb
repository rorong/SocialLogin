class HomesController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @image = current_user.image.present? ? current_user.image : 'logo.jpg'
  end
end
