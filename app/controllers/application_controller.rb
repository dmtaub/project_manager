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
      msg = "Sorry, you can only do that if you're an administrator."
      respond_to do |format|
        format.html{
          flash[:notice] = msg
          redirect_to root_path
        }
        format.json {
          render :json => msg, :status => 401
        }
      end
    end
  end
end
