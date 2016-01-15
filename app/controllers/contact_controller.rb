class ContactController < ApplicationController
  def index
    if params.has_key?("g-recaptcha-response")
      if Fxgoogle.recaptcha_verify(params[:"g-recaptcha-response"])
        Notifier.contact(params[:name], params[:email], params[:phonenumber], params[:message]).deliver_now!
        @message_sent = true
      end
    end
  end
end
