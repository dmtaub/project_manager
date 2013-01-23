class ApplicationController < ActionController::Base
  protect_from_forgery
  def verify_admin
    authenticate_user!
    if !current_user || !current_user.admin?
      if !!current_user && User.where(:admin=>true).count == 0
        current_user.admin = true
        current_user.save!
        return
      end
      flash[:notice] = "Need administrator rights to access that page."
      redirect_to root_path
    end
  end
end
