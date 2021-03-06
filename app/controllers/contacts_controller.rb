class ContactsController < ApplicationController

  # GET request to /contact-us
  # Show new contact form page
  def new
    @contact = Contact.new
  end

  # POST request /contacts
  def create
    # Instantiate new Contact Object
    @contact = Contact.new(contact_params)
    if @contact.save # Saves to database and returns true or false
      first_name = params[:contact][:first_name]
      last_name = params[:contact][:last_name]
      email = params[:contact][:email]
      company_name = params[:contact][:company_name]
      body  = params[:contact][:comments]
      ContactMailer.contact_email(first_name, last_name, email, company_name, body).deliver # Calls contact_email function from ContactMailer class
      flash[:success] = "Message sent."# Changable :success
      redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end

  private
    # Collects data from form
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :company_name, :comments)
    end
end
