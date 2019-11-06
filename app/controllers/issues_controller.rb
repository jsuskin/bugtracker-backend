class IssuesController < ApplicationController
  def index
    issues = Issue.all
    render json: issues.to_json(:only => [:id, :summary, :expected_output, :actual_output, :status, :project_id])
  end

  def create
    issue = Issue.create(issue_params)
    if issue.valid?
      render json: issue
    else
      render json: { errors: issue.errors.full_messages }, status: 422
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:summary, :expected_output, :actual_output, :status, :project_id)
  end
end
