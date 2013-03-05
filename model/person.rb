require '../lib/conection.rb'
require '../model/super_model.rb'
require '../lib/adapter.rb'
require 'debugger'

class Person #< SuperModel
	attr_accessor :name, :last_name, :phone, :id

	def initialize(person_info)
    @id = person_info[:id]
    @name = person_info[:name]
    @last_name = person_info[:last_name]
    @phone = person_info[:phone]
    #@addresses = addresses
  end

  def save()
    
  end

  def self.table_name
    "person"
  end

  def create()
      fields = ["name, last_name, phone"]
      values = [@name, @last_name, @phone]
      Adapter.create(self.class.table_name, fields, values)
  end

  def self.find(id)
      person_info = Adapter.find(table_name, id).first
      Person.new({:id => person_info["id"], :name => person_info["name"], :last_name => person_info["last_name"], :phone => person_info["phone"]})
  end

  def self.addresses(id)
    addresses = []
      addresses_info = Address.find_by("id_person", id).each do |address|
        address[:id] = item["id"]
        address[:id_person] = item["id_person"]
        address[:name] = item["name"]
        addresses.push(Address.new(address))
      end
  end

  def destroy()
      Adapter.destroy(Person.table_name, id)
      Person.addresses(id).each do |item|
        Address.destroy(item.id)
      end
  end  

  def update_attributes(id, fields, values)
      Adapter.update(self.class.table_name, id, fields, values)
  end

  def self.show_all
      person_info = Adapter.find_all(Person.table_name)
      people = []
      person_info.each do |item|
        person_hash = {}
        person_hash[:id] = item["id"]
        person_hash[:name] = item["name"]
        person_hash[:last_name] = item["last_name"]
        person_hash[:phone] = item["phone"]
        people.push(Person.new(person_hash))
      end
      people
  end
end