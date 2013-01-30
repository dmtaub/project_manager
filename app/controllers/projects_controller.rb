class ProjectsController < ApplicationController
  before_filter :verify_admin
  before_filter :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @columns = Project.displayColumns
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: {html: (render_to_string :template => 'projects/_row.html.haml', :locals => {:project => @project}) }, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update

    respond_to do |format|
      parameters = params[:project].slice(:project, :target_completion, :status, :notes)
      if parameters.has_key? :target_completion
        parameters[:target_completion] = Date.parse(parameters[:target_completion])
      end
      if @project.update_attributes(parameters)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { respond_with_bip(@project)}#head :no_content }
      else
        format.html { render action: "edit" }
        format.json { respond_with_bip(@project)}#render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
end
