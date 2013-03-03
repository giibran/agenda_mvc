require '../lib/conection.rb'
require '../model/super_model.rb'
require '../lib/adapter.rb'

class Person #< SuperModel
	attr_accessor :name, :last_name, :phone, :table

	def initialize(person_info)
    @table = person
    @name = person_info[0]
    @last_name = person_info[1]
    @phone = person_info[2]
    #@addresses = addresses
  end

  def save()
    
  end

  def create()
      fields = ["name, last_name, phone"]
      values = [@name, @last_name, @phone]
    	adapter = Adapter.new
      id = adapter.create("person", fields, values)
  end

  def find(id)
    	person = Adapter.new
      person.find(id)
  end

  def destroy(id)
    	person = Adapter.new
      person.destroy(id)
  end  

  def update_attributes(id, fields, values)
    	person = Adapter.new
      person.update(@table, id, fields, values)
  end

  def show_all
      person = Adapter.new
      person.find_all(@table)
  end
end