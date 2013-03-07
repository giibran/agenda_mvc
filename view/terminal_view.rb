require '../model/person.rb'
require '../model/address.rb'
require 'debugger'

class TerminalView

	def self.print_menu
		print(" 1) add new person \n 2) show all people \n 3) edit person \n 4) delete person\n 5) exit\n")
  end
	
	def self.input
		word = gets.chomp()
    if word.empty?
      puts "Empty value is not allowed, please send a correct value."
      TerminalView.input
    end
    word
	end

	def self.ask_info_person
    person_info = {}
    puts "name:"
    person_info[:name] = self.input
    puts "lastname:"
    person_info[:last_name] = self.input
    puts "phone:"
    person_info[:phone] = self.input
    person_info
  end
    
  def self.ask_info_address
    one_more = "1"
    addresses = []
    while one_more == "1"
      puts "address:"
      addresses.push(self.input)
      puts " 1)add other address? \n 2) NO add"
      one_more = self.input
    end
    addresses
  end

	def self.print_contact(person_info, address_info)
		print("NAME: #{person_info[0]} \nLAST NAME: #{person_info[1]} \nPHONE: #{person_info[2]} \nADDRESS:\n")
    address_info.each do |address|
      print("#{address}\n")
    end
	end	

  def self.print_pair(person_info)
    print("ID: #{person_info.id} NAME: #{person_info.name}\n")
  end

  def self.ask_wich_user
    print("Type Id user to do action?\n")
    self.input
  end

  def self.edit_contact(person_info, address_info)
    person_info.name = TerminalView.ask_change_info("NAME", person_info.name)
    person_info.last_name = TerminalView.ask_change_info("LAST NAME", person_info.last_name)
    person_info.phone = TerminalView.ask_change_info("PHONE", person_info.phone)
    address_info.each do |address|
      address.address = TerminalView.ask_change_info("ADDRESS", address.address)
    end
    new_info = [person_info, address_info]
  end

  def self.ask_change_info(key, value)
    puts "#{key}: #{value}"
    puts "do you want change this value? \n1)Yes, 2)NO "
    change_value = gets.chomp()
    if change_value == "1"
      value = TerminalView.ask_new_value
    end
    value
  end

  def self.ask_new_value
    puts("what is the new value?")
    gets.chomp()
  end
end