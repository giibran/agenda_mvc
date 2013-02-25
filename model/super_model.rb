require '../lib/conection.rb'
class Super_model
	attr_accessor :table, :fields, :value

	def initialize(table, fields, value)
    	@table = table
	    @field = field
	    @value = value
	end

	def save()
    	
  	end

  	def create(table, fields, value)
    	query_address = "INSERT INTO #{table}(id_person, address) VALUES('#{id_person}', '#{address}');"
   		send_query(query_address)
 	end

	def find(id_person)
	    query_person = "SELECT * FROM address WHERE id_person = '#{id_person}';"
	    send_query(query_person)
	end

	def destroy(id_person)
	    query_person = "DELETE FROM address WHERE id_person = '#{id_person}';"
	    send_query(query_person)
	end  

	def update_attributes(id)
	    query_person = "UPDATE person SET  id = '#{id}' WHERE id = #{id};"
	    send_query(query_person)
	end
end