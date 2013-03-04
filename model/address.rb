require '../lib/conection.rb'
require '../lib/adapter.rb'
class Address #< SuperModel
	attr_accessor :id_person, :address, :table

	def initialize(id_person, address)
    @table = "address"
    @id_person = id_person
    @address = address
	end

  def save()
    
  end

  def create()
      fields = ["id_person, address"]
      values = [@id_person, @address]
      adapter = Adapter.new
      id = adapter.create(@table, fields, values)
  end

  def find(id)
      address = Adapter.new
      address.find(id)
  end

  def find_by(field, value)
      address = Adapter.new
      address.find_by(@table, field, value)
  end

  def destroy(id)
      address = Adapter.new
      address.destroy(id)
  end  

  def update_attributes(id, fields, values)
      address = Adapter.new
      address.update(@table, id, fields, values)
  end

  def show_all
      address = Adapter.new
      address.find_all(@table)
  end
end