class Notifier < ApplicationMailer
  def contact(name, email, phonenumber, message)
    @name = name
    @email = email
    @phonenumber = phonenumber
    @message = message
    mail(:to => "jp.piazzolla@academia.lu", :subject => "Contact message from academia.lu")        
  end
end
