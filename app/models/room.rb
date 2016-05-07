class Room < ActiveRecord::Base
	belongs_to :user
	self.inheritance_column = nil
	validates :price, :adult, :kid, :presence => { :message => "*Introduce este dato." }
end
