class StaticPagesController < ApplicationController

  def home
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

  def admin
  end

  def registro
  end

  def terms
  end

  def aviso
  end

  def habitaciones
  end

  def restaurante
  end

  def contact
    
  end

end
