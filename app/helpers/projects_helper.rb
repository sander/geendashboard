module ProjectsHelper
  def can_write project
    project.involvements.find_by(user: current_user).role.can_write
  end
end
