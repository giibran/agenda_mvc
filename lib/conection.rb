require 'mysql2'

class Conection

	def self.send_query(query)
		conect = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "", :database => "agenda")
		result = conect.query(query)
	end
end