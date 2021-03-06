class ReceivedMailer < ActionMailer::Base
  default from: 'example@gmail.com'
  def received_email(name, email)
    @name = name
    @email = email
    mail(:to => email, subject: 'Package has been received')
  end
end
