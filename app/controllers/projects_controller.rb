class ProjectsController < ApplicationController
  def index
    if current_user
      @projects = current_user.projects
      @properties = Property.all
    end
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]

    if @project.update project_params
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def new
    @project = Project.new

    if current_user.wunderlist_account
      @lists = current_user.wunderlist_account.lists.map do |list|
        list['title']
      end
    end
  end

  def create
    @project = Project.new project_params

    if @project.save
      role = Role.find_or_create_by name: 'owner'
      involvement = @project.involvements.create user: current_user, role: role
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy

    redirect_to root_path
  end

  private
    def project_params
      params.require(:project).permit :name, :goal, :visible, :active
    end
end
