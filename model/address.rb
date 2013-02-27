require '../lib/conection.rb'
class Address < SuperModel
	attr_accessor :id_person, :Address

	def initialize(id_person, address)
    @id_person = id_person
    @address = address
	end

	def save()
    	
  end

  def create(id_person, address)
    query_address = "INSERT INTO address(id_person, address) VALUES('#{id_person}', '#{address}');"
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

  def show_all_person(id_person)
    query_person = "SELECT * FROM address WHERE id_person = '#{id_person}'"
  end
end