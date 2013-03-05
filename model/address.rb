require '../lib/conection.rb'
require '../lib/adapter.rb'
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
      id = Adapter.create(self.class.table_name, fields, values)
  end

  def self.table_name
    "address"
  end

  def self.find(id)
      Adapter.find(id)
  end

  def self.find_by(field, value)
      Adapter.find_by(Address.table_name, field, value)
  end

  def destroy(id)
      Adapter.destroy(id)
  end  

  def update_attributes(id, fields, values)
      Adapter.update(self.class.table_name, id, fields, values)
  end

  def self.show_all
      address_info = Adapter.find_all(Address.table_name)
      address = []
      address_info.each do |item|
        address_info[:id] = item["id"]
        address_info[:id_person] = item["id_person"]
        address_info[:name] = item["name"]
        people.push(Person.new(person_info))
      end
      people
  end
end