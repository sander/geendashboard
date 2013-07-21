class RolesController < ApplicationController
  def index
    @roles = Role.all
    @role = Role.new
  end

  def create
    @role = Role.new role_params

    if @role.save
      redirect_to roles_path
    else
      render roles_path
    end
  end

  def update
    @role = Role.find params[:id]

    if @role.update role_params
      redirect_to roles_path
    else
      render roles_path
    end
  end

  def destroy
    @role = Role.find params[:id]
    @role.destroy

    redirect_to roles_path
  end

  private
    def role_params
      params.require(:role).permit :name, :can_write
    end
end
