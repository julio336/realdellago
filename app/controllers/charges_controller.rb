class ChargesController < ApplicationController
  def index
  end

  def create
  	begin
	  @charge = Conekta::Charge.create({
	    amount: 51000,
	    currency: "MXN",
	    description: "Pizza Delivery",
	    reference_id: "orden_de_id_interno",
		card: params['conektaTokenId'],
	    details: {
	    	email: "logan@x-men.org",
	      	line_items: [{
		        "name"=> "Box of Cohiba S1s",
		        "description"=> "Imported From Mex.",
		        "unit_price"=> 20000,
		        "quantity"=> 1,
		        "sku"=> "cohb_s1",
		        "category"=> "food"
	      }]
	    }
	  })
		rescue Conekta::ParameterValidationError => e
		  puts e.message_to_purchaser 
		  #alguno de los parámetros fueron inválidos

		rescue Conekta::ProcessingError => e
		  puts e.message_to_purchaser 
		  #la tarjeta no pudo ser procesada

		rescue Conekta::Error => e
		  puts e.message_to_purchaser 
		  #un error ocurrió que no sucede en el flujo normal de cobros como por ejemplo un auth_key incorrecto

		end
  end

  def show
  end
end
