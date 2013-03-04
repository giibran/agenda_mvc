require '../model/person.rb'
require '../model/address.rb'
require '../view/terminal_view.rb'
require 'debugger'

class Agenda
	attr_accessor :terminal_view
	
	def initialize
		@terminal_view = TerminalView.new
		@person = Person.new(["true", "true", "true"])
		@address = Address.new("true", "true")
	end

	def menu
		menu = TerminalView.new
		option = 0
		while option != "5"
      menu.print_menu
			option = menu.input
	      case option
	      when "1"
	       add_contact
	      when "2"
	      	list_contacts
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
		person_info =[]
  	all = @person.show_all
  	all.each do |item|
  		address_info = []
  		person_id = item["id"]
  		person_info[0] = item["name"]
  		person_info[1] = item["last_name"]
  		person_info[2] = item["phone"]
  		all_address = @address.find_by("id_person", person_id)
  		all_address.each do |item|
  			address_info.push(item["address"])
  		end
  		@terminal_view.print_contact(person_info, address_info)
  	end
	end

	def add_contact
		person_info = @terminal_view.ask_info_person
	  address_info = @terminal_view.ask_info_address
	  @person = Person.new(person_info)
	  id = @person.create().first["id"]
	  address_info.each do |address|
	  	@address = Address.new(id, address)
	   	@address.create()
	  end

	end

	def edit_contact(id)
		
	end

	def destroy_contact(id)
		
	end


end

contacts = Agenda.new
contacts.menu
