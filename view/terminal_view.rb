require '../model/person.rb'
require '../model/address.rb'

class Terminal_view

	def print_menu
		print(" 1) add new person \n 2) show all people \n 3) edit person \n 4) delete person\n 5) exit\n")
    end
	
	def input
		gets.chomp()
	end

	def ask_info
    puts "name:"
    name = input
    puts "lastname:"
    lastname = input
    puts "phone:"
    phone = input
    one_more = "1"
    addresses = []
    while one_more == "1"
      puts "address:"
      address_temp = input
      addresses << Address.new(1,address_temp)
      puts " 1)add other address? \n 2) NO add"
      one_more = input
    end
    @people << Person.new(id, name, lastname, phone, addresses)
	end

	def show_all()
		print()
	end	
end