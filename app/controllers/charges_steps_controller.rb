class ChargesStepsController < ApplicationController

	include Wicked::Wizard
	steps :calendar, :room_select, :payment

	def show
		render_wizard
	end

end
