require '../model/person.rb'
require '../model/address.rb'
require '../view/terminal_view.rb'
require 'debugger'

class Agenda
	attr_accessor :terminal_view
	

	def menu
		option = 0
		while option != "5"
      TerminalView.print_menu
			option = TerminalView.input
	      case option
	      when "1"
	        add_contact
	      when "2"
	      	list_contacts
	      when "3"
	        id_person = choose_user
	        edit_contact(id_person)
	      when "4"
	        id_person = choose_user
	        destroy_contact(id_person)
	      when "5"
	        puts "SEE YOU LATER ALLIGATOR"                    
	      else
	        puts "INVALID OPTION"
	      end  
	  end              
	end

	def list_contacts
		person_info =[]
  	all = Person.show_all
  	all.each do |item|
  		address_info = []
  		person_id = item.id
  		person_info[0] = item.name
  		person_info[1] = item.last_name
  		person_info[2] = item.phone
  		all_address = Address.find_by("id_person", person_id)
  		all_address.each do |item|
  			address_info.push(item["address"])
  		end
  		TerminalView.print_contact(person_info, address_info)
  	end
	end

	def add_contact
		person_info = TerminalView.ask_info_person
	  address_info = TerminalView.ask_info_address
	  @person = Person.new(person_info)
	  id = @person.create().first["id"]
	  address_info.each do |address|
	  	address_info = {}
	  	address_info[:id_person] = id
	  	address_info[:address] = address
	  	@address = Address.new(address_info)
	   	@address.create()
	  end

	end

	def choose_user
  	people = Person.show_all
  	people.each do |item|
  		TerminalView.print_pair(item)
  	end
  	TerminalView.ask_wich_user
	end

	def edit_contact(id)
		person = Person.find(id)
		addresses = []
		Address.find_by("id_person", person.id).each do |item|
			addresses.push(item)
		end
		TerminalView.edit_contact(person, addresses)
	end

	def destroy_contact(id)
		person = Person.find(id)
		person.destroy
	end


end

contacts = Agenda.new
contacts.menu
