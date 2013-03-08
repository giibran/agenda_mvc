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

  def create(info)
    id = Adapter.create(self.class.table_name, info)
  end
  	
	def self.find(id)
    address_info = Adapter.find(Address.table_name, id).first
    Address.new({:id => address_info["id"], :id_person => address_info["id_person"], :address => address_info["address"]})
  end

	def update_attributes(fields, values)
    Adapter.update(self.class.table_name, id, fields, values)
 	end 
end