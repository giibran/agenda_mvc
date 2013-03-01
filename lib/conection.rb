require 'mysql2'

class Conection

	def send_query(query)
		conect = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "agenda")
		result = conect.query(query)
	end
end