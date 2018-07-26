class ApplicationMailer < ActionMailer::Base
  Roadie::Rails::Automatic
  default from: 'from@example.com'
  layout 'mailer'
end
