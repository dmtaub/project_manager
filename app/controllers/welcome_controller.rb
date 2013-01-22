class WelcomeController < ApplicationController
  def index
    @users = User.all
    #@user = User.first

    @projects = Project.all#where :user_id => @user.id
    #@columns = Project.column_names.select {|x| not x.include? "_"}
    @columns = ["name","completion","status","notes"]

  end
end
