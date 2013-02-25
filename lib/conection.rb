require 'mysql2'
#require 'sqlite3-ruby'

class Conection
	attr_accessor :conect

	def initialize()
		@conect = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "agenda")
	end

	def send_query (query)
		result = @conect.query(query)
	end
end