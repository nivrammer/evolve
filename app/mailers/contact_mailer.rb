class ContactMailer < ActionMailer::Base
  default to: 'cayetanomarvin@gmail.com'

  def contact_email(first_name, last_name, email, company_name, body)
    @first_name = first_name
    @last_name= last_name
    @email = email
    @company_name= company_name
    @body = body

    mail(from: email, subject: 'Contact Form Message')
  end
end
