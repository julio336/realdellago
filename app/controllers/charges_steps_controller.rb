class ChargesStepsController < ApplicationController

	include Wicked::Wizard
	steps :calendar, :room_select, :payment

	def show
		@contact = Contact.new(params[:contact])
	    @contact.request = request
	    if @contact.deliver
	      flash.now[:notice] = 'Gracias por tu mensaje, pronto nos pondremos en contacto contigo.'
	    else
	      flash.now[:error] = 'El mensaje no se pudo envíar, por favorintentelo más tarde.'
	    end
		render_wizard

	end

end
