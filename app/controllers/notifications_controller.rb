class NotificationsController < ApplicationController
  def notify
    # byebug
    github_issue = issue_params

    issue = Issue.new(url: github_issue[:url],
                      github_id: github_issue[:id],
                      number: github_issue[:number])
    if issue.save
      NotificationMailer.with(issue_url: issue.url).send_data_export.deliver_now
      render status: :no_content
    else
      render status: :unprocessable_entity
    end
  end

  # Only allow a trusted parameter "white list" through.
  def issue_params
    params.require(:issue).permit(:url, :number, :id)
  end
end
