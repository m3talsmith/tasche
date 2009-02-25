class ProjectsController < ApplicationController
  def index
    @projects = Project.find(:all)
  end
  
  def create
    project = Project.find_or_create(:name => params[:project][:name])
    @current_user.projects << project
    project.update_attributes(params[:project])
    
    flash[:notice] = "Your Project is ready for you."
    redirect_to project_path(project.id)
  end
  
  def show
    @project = find_project(params[:id])
  end
  
  def edit
    @project = find_project(params[:id])
  end
  
  def update
    project = find_project(params[:id])
    if project && project.update_attributes(params[:project])
      flash[:notice] = "#{project.name} (id ##{project.id}) has been updated as requested."
      redirect_to project_path(project.id)
    else
      flash[:error] = "We couldn't update #{project.name} (id ##{project.id}). We either couldn't find it or something else is wrong. We brought you back to the edit page for review. Please try again."
      redirect_to project_path(params[:id])
    end
  end
  
  private
    def find_project(id)
      Project.find(:first, :conditions => ["id = ?", id])
    end
   
  def destroy
    project = Project.find(params[:id])
    if project.destroy
      flash[:notice] = "Your project has been destroyed"
      redirect_to root_path
    else
      flash[:error] = "We couldn't destroy your project. Please try again."
      redirect_to project_path(params[:id])
    end
  end   
end
