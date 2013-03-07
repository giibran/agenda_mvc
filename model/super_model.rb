require '../lib/conection.rb'
require '../lib/adapter.rb'
require 'debugger'

class SuperModel
	attr_accessor :table, :fields, :value

	def initialize(table, fields, value)
  	@table = table
	  @field = field
	  @value = value
	end

	def save()
    	
  end

  def create(field, values)
    id = Adapter.create(self.class.table_name, fields, values)
  end

  	
	def find(id_person)
	  query_person = "SELECT * FROM address WHERE id_person = '#{id_person}';"
	  send_query(query_person)
	end

	def update_attributes(fields, values)
    Adapter.update(self.class.table_name, id, fields, values)
 	end 
end