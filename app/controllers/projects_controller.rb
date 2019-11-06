class ProjectsController < ApplicationController
  def index
    projects = Project.all
    render json: projects.to_json( :only => [:title], :include => [:issues] )
  end

  def create
    project = Project.create(project_params)
    if project.valid?
      render json: project
    else
      render json: { errors: project.errors.full_messages }, status: 422
    end
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end
end
