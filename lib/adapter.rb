require '../lib/conection.rb'
require 'debugger'

class Adapter 
	def save()
    	
  end

  def create(table, fields, value)
    	query_address = "INSERT INTO #{table}(#{fields.join(',')}) VALUES(#{value.map {|x| "'#{x}'"}.join(',')});"
    	conect = Conection.new
   		conect.send_query(query_address)
   		query_id = "SELECT * FROM person ORDER BY id DESC LIMIT 1"
   		id = conect.send_query(query_id)
   		id.first["id"]
 	end

 	def create_address(table, id_person, fields, value)
    	value.each do |item|
    		query_address = "INSERT INTO #{table}(#{fields.join(',')}) VALUES('#{id_person}', '#{item}');"
    		conect = Conection.new
   			conect.send_query(query_address)
   		end
 	end

  def show_all()
    
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