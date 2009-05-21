class TasksController < ApplicationController
  def new
    @project = find_project(params[:project_id])
    @task = Task.new
  end
  
  def create
    project = find_project(params[:project_id])
    task = Task.create(params[:task])
    
    if task
      project.tasks << task
      project.users << @current_user
      project.save!
      
      task.users << @current_user
      task.user = @current_user
      task.save!
      
      flash[:notice] = "Your task was created. Now get cracking!"
      redirect_to project_path(project.id)
    else
      flash[:error] = "We couldn't create your task. Please try again."
      redirect_to new_project_task(:project_id => project.id)
    end
  end
  
  def show
  end
  
  def update
  end
  
  def destroy
  end
  
  private
    def find_project(id)
      return Project.find(:first, :conditions => {:id => id})
    end
end
