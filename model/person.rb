require '../lib/conection.rb'
require '../model/super_model.rb'
require '../lib/adapter.rb'

class Person #< SuperModel
	#attr_accessor :name, :last_name, :phone, :addresses

	def initialize(person_info)
    @name = person_info[0]
    @last_name = person_info[1]
    @phone = person_info[2]
    #@addresses = addresses
  end

  def save()
    	
  end

  def create(value)
      fields = ["name, last_name, phone"]
    	adapter = Adapter.new
      id = adapter.create("person", fields, value)
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