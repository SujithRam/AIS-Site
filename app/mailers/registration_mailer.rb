class RegistrationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.signup_confirmation.subject
  default from: "railstest@test.com"
  
  def signup_confirmation(registration)
    @registration = registration
    mail to: @registration.email, subject: "Welcome to our app"
  end
end
