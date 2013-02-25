require 'mysql2'
#require 'sqlite3-ruby'

class Conection

	def send_query (query)
		conect = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "agenda")
		result = @conect.query(query)
	end
end