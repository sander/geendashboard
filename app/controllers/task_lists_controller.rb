class TaskListsController < ApplicationController
  def show
    @project = Project.find params[:project_id]
    @list = @project.wunderlist_task_list || @project.build_wunderlist_task_list

    @options = current_user.wunderlist_account.lists.map do |list|
      [list['title'], list['id']]
    end
  end

  def update
    id = params['list_id']

    @project ||= Project.find params[:project_id]
    @list ||= @project.wunderlist_task_list
    @list.wunderlist_id = id
    @list.tasks = current_user.wunderlist_account.items(id).to_json
    @list.save

    redirect_to @project
  end

  def create
    @project = Project.find params[:project_id]
    @list = @project.build_wunderlist_task_list
    update
  end
end
