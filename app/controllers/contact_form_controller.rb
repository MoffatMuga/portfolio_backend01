class ContactFormController < ApplicationController
    def create
        contact = Contact.new(contact_params)
    
        if contact.save
          ContactMailer.with(contact: contact).send_contact_email.deliver_now
          render json: { success: true, message: 'Form submitted successfully!' }
        else
          render json: { success: false, errors: contact.errors.full_messages }
        end
      end
    
      private
    
      def contact_params
        params.require(:contact).permit(:name, :email, :message)
      end
end
