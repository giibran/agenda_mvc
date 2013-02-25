class Terminal_view
	attr_accessor :terminal_view

	def initialize
		@terminal_view = true
	end

	def print_menu
		print(" 1) add new person \n 2) show all people \n 3) edit person \n 4) delete person\n 5) exit\n")
    option = gets.chomp()
  end
	
	def print_pair

	end	
end