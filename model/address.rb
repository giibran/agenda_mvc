require '../lib/conection.rb'
class Address #< SuperModel
	attr_accessor :id_person, :address

	def initialize(id_person, address)
    @id_person = id_person
    @address = address
	end

  def save()
    
  end

  def create()
      fields = ["id_person, address"]
      values = [@id_person, @address]
      adapter = Adapter.new
      id = adapter.create("address", fields, values)
  end

  def find(id)
      address = Adapter.new
      address.find(id)
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