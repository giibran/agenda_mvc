require 'mysql2'
#require 'sqlite3-ruby'

class Data_base() 

	def send_query (query)
		client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "agenda")
		result = client.query(query)
	end
end