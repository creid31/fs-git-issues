class NotificationMailer < ApplicationMailer
  def send_data_export
    @issue_url = params[:issue_url]
    @data_url = 'https://export.fullstory.com/api/v1/export/get?id=' + retrieve_export_id
    mail(to: ENV['support_email'], subject: 'Issue Created')
  end

private
  def retrieve_export_id
    headers = { "Authorization": 'Basic ' + ENV['fullstory_key'] }
    response = HTTParty.get('https://export.fullstory.com/api/v1/export/list', headers: headers)
    json = JSON.parse(response.body)
    json['exports'].last['Id'].to_s
  end
end
