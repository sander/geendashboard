class InvolvementsController < ApplicationController
  def create
    @project = Project.find params[:project_id]
    @involvement = @project.involvements.create involvement_params
    redirect_to edit_project_path @project
  end

  def destroy
    @project = Project.find params[:project_id]
    @involvement = @project.involvements.find params[:id]
    @involvement.destroy
    redirect_to edit_project_path @project
  end

  private
    def involvement_params
      params.require(:involvement).permit :user_id, :role_id
    end
end
