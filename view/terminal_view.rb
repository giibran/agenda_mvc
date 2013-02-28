require '../model/person.rb'
require '../model/address.rb'

class TerminalView

	def print_menu
		print(" 1) add new person \n 2) show all people \n 3) edit person \n 4) delete person\n 5) exit\n")
  end
	
	def input
		gets.chomp()
	end

	def ask_info_person
    person_info =[]
    puts "name:"
    person_info[0] = input
    puts "lastname:"
    person_info[1] = input
    puts "phone:"
    person_info[2] = input
    person_info
  end
    
  def ask_info_address
    one_more = "1"
    addresses = []
    while one_more == "1"
      puts "address:"
      addresses.push(input)
      puts " 1)add other address? \n 2) NO add"
      one_more = input
    end
    addresses
  end
    
    #@people << 
    #m =Person.new(id, name, lastname, phone, addresses).first

	def show_all()
		print()
	end	
end