require '../model/person.rb'
require '../model/address.rb'
require '../view/terminal_view.rb'
class Agenda
	attr_accessor :contact
	
	def initialize
		@contact = contact
	end

	def menu
		menu = Terminal_vew.new
		menu.print_menu
	end

	def list_contacts
	end

	def add_contact
		
	end

	def edit_contact(id)
		
	end

	def destroy_contact(id)
		
	end


end

@contacts = Contacts.new
@contacts.menu
