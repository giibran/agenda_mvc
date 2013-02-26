require '../model/person.rb'
require '../model/address.rb'
require '../view/terminal_view.rb'
class Agenda
	attr_accessor :terminal_view
	
	def initialize
		@terminal_view = Terminal_view.new
	end

	def menu
		menu = Terminal_view.new
		option = 0
		while option != "5"
        	menu.print_menu
			option = menu.input
	      case option
	      when "1"
	        @terminal_view.ask_info
	      when "2"
	        show_all()
	      when "3"
	        selected_user = select_user()
	        edit_person(selected_user)
	      when "4"
	        selected_user = select_user()
	        delete_person(selected_user)
	      when "5"
	        puts "SEE YOU LATER ALLIGATOR"                    
	      else
	        puts "INVALID OPTION"
	      end    
	  end              
	end

	def list_contacts
	end

	def add_contact
		contact = @terminal_view.ask_info
	end

	def edit_contact(id)
		
	end

	def destroy_contact(id)
		
	end


end

contacts = Agenda.new
contacts.menu
