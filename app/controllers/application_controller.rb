class ApplicationController < ActionController::Base
  protect_from_forgery
  def verify_admin
    authenticate_user!
    if !current_user || !current_user.admin?
      flash[:notice] = "Need administrator rights to access that page."
      redirect_to root_path
    end
  end
end
