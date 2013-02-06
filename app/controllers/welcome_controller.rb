class WelcomeController < ApplicationController
  before_filter :verify_admin, only: :reorder_projects
  def reorder_projects
    respond_to do |format|
      format.html { raise ActionController::RoutingError.new('Not Found') }
      format.json {
         user_id= params[:welcome_id]
         @user = User.find(user_id)
         @projects = @user.projects
         priority = 1
         JSON.parse(params[:projects]).each do |id|
           project = @projects.where(:id => id)[0]
           render :status => :fail and return if project.nil?
           project.priority = priority
           project.save!
           priority += 1
         end
         render :json => :ok
      }
    end
  end
  
  def index
    @users = User.all
    #@user = User.first

    #@projects = Project.all#where :user_id => @user.id
    @projects = Project.order(:priority)
    #@columns = Project.column_names.select {|x| not x.include? "_"}
    @columns = Project.displayColumns

  end
end
