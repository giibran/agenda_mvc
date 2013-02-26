require '../lib/conection.rb'
class Person
	attr_accessor :name, :last_name, :phone, :addresses

	def initialize(id, name, last_name, phone, addresses)
    @id = id
    @name = name
    @last_name = last_name
    @phone = phone
    @addresses = addresses
  end

  def save()
    	
  end

  def create(name, last_name, phone, addresses)
    	query_person = "INSERT INTO person(name,last_name,phone) VALUES('#{name}', '#{last_name}', '#{phone}');"
      send_query(query_person)
      current_id = "SELECT * FROM person ORDER BY id DESC LIMIT 1;"
      #current_id = send_query(current_id)
      #addresses.each{ |item| query_address = "INSERT INTO address(id_person,address) VALUES('#{current_id}', '#{item}');" send_query(query_address) } 
  end

  def find(id)
    	query_person = "SELECT * FROM person WHERE id = '#{id}';"
      send_query(query_person)
  end

  def destroy(id)
    	query_person = "DELETE FROM person WHERE id = '#{id}';"
      send_query(query_person)
      query_person = "DELETE FROM address WHERE id_person = '#{id}';"
      send_query(query_person)
  end  

  def update_attributes(id)
    	query_person = "UPDATE person SET  id = '#{id}' WHERE id = #{id};"
      send_query(query_person)
  end

  def show_all
    query_person = "SELECT * FROM person;"
    send_query(query_person)    
  end
end