class UtsavRegistrationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.signup_confirmation.subject
  default from: "no-reply@aisullafayette.com"
  
  def details_confirmation(utsav_registration)
    @utsav_registration = utsav_registration
    mail(:to => @utsav_registration.email, :subject => "Association of Indian Students", :bcc => "ais.ullafayette@gmail.com")
  end
end
