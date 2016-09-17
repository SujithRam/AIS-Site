class UtsavSeatMailer < ApplicationMailer
  default from: "no-reply@aisullafayette.com"
  
  def details_confirmation(utsav_seat)
    attachments.inline['aislogo_opti.jpg'] = File.read(File.join(Rails.root, 'app','assets', 'images','aislogo_opti.jpg'))
    @utsav_seat = utsav_seat
    mail(:to => @utsav_seat.email, :subject => "Association of Indian Students", :bcc => "ais.ullafayette@gmail.com")
  end
  
  def indian_details_confirmation(utsav_seat)
    attachments.inline['aislogo_opti.jpg'] = File.read(File.join(Rails.root, 'app','assets', 'images','aislogo_opti.jpg'))
    @utsav_seat = utsav_seat
    mail(:to => @utsav_seat.email, :subject => "Association of Indian Students", :bcc => "ais.ullafayette@gmail.com")
  end
end
