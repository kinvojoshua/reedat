Devise::Mailer.class_eval do
  self.asset_host = nil
  include Roadie::Rails::Automatic

  private

  def roadie_options
    super unless Rails.env.test?
  end
end