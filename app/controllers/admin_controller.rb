class AdminController < ApplicationController
  before_filter :verify_admin
  def delete_user
    u=User.find(params[:admin_id])
    if u==current_user
      flash[:alert]= "Cannot delete admin user!"  
    else
      u.destroy
      u.projects.each{|p|p.destroy}
    end
    redirect_to admin_index_path
  end  
  def index

  end
end
