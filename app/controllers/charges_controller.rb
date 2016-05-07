class ChargesController < ApplicationController
  def index
  end

  def create
  	begin
  		#byebug
	  @charge = Conekta::Charge.create({
        amount: params['total'],
       "start-date"=> params['start-date'],
       "end-date"=> params['end-date'],
	    "currency"=> "MXN",
	    "description"=> "Pizza Delivery",
	    "reference_id"=> "orden_de_id_interno",
	    "card"=> params[:conektaTokenId], #"tok_test_visa_4242",
	    # Sistema antifraude lo ocupa para checar si es o no robada la Tarjeta
	    "details"=> {
	      "name"=> "Arnulfo Quimare",
	      "phone"=> "403-342-0642",
	      "email"=> "logan@x-men.org",
	      "line_items"=> [{
	        "name"=> "Box of Cohiba S1s",
	        "description"=> "Imported From Mex.",
	        "unit_price"=> 20000,
	        "quantity"=> 1,
	        "sku"=> "cohb_s1",
	        "category"=> "food"
	      }],
	      # Buenas prácticas
	      "billing_address"=> {
	        "street1"=>"77 Mystery Lane",
	        "street2"=> "Suite 124",
	        "city"=> "Darlington",
	        "state"=>"NJ",
	        "zip"=> "10192",
	        "country"=> "Mexico",
	        "tax_id"=> "xmn671212drx",
	        "company_name"=>"X-Men Inc.",
	        "phone"=> "77-777-7777",
	        "email"=> "purshasing@x-men.org"
	      }
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
