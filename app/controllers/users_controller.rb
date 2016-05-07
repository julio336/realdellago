class UsersController < ApplicationController
	before_filter :authenticate_user!

	def index
		@rooms = current_user.rooms
	end

end