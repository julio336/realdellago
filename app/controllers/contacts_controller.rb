class ContactsController < ApplicationController
	
	def new
    	@contact = Contact.new
  	end

  	def create
    	@contact = Contact.new(params[:contact])
    	@contact.request = request
    	if @contact.deliver
      		flash.now[:notice] = 'Gracias por tu mensaje, pronto nos pondremos en contacto contigo.'
      		render :file => 'static_pages/home'
    	else
      		flash.now[:error] = 'El mensaje no se pudo envíar, por favorintentelo más tarde.'
		    render :file => 'static_pages/home'
    	end
  	end
end
