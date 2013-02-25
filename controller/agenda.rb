require '../model/person.rb'
require '../model/address.rb'
require '../view/terminal_view.rb'
class Agenda
	attr_accessor :contact
	
	def initialize
		@contact = true
	end

	def menu
		menu = Terminal_view.new
		menu.print_menu
		option = menu.input
	
		while option != "5"
        	menu.print_menu
			option = menu.input
            case option
            when "1"
              add_person()
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
		
	end

	def edit_contact(id)
		
	end

	def destroy_contact(id)
		
	end


end

contacts = Agenda.new
contacts.menu
