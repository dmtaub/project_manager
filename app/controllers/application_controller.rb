class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def verify_admin
    authenticate_user!
    if !current_user || !current_user.admin?
      flash[:notice] = "Need Administrator rights to Access that page."
      redirect_to root_path
    end
  end
  protect_from_forgery with: :exception
end
