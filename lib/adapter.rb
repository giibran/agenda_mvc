require '../lib/conection.rb'

class Adapter 
	def save()
    	
  	end

  	def create(table, fields, value)
    	query_address = "INSERT INTO #{table}(#{fields.join(',')}) VALUES(#{value.map {|x| "'#{x}'"}.join(',')});"
    	conect = Conection.new
   		conect.send_query(query_address)
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