class ApplicationMailer < ActionMailer::Base
  Roadie::Rails::Automatic
  self.asset_host = nil
  default from: 'from@example.com'
  layout 'mailer'
end
