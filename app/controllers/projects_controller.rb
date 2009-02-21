class ProjectsController < ApplicationController
  def index
    @projects = Project.find(:all)
  end
end
