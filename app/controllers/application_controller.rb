class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!

  def authenticate_admin
    redirect_to root_path unless current_user.admin
  end
end
