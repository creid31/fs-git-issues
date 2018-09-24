class ApplicationMailer < ActionMailer::Base
  default from: "from@#{ENV['website']}"
  layout 'mailer'
end
