require '../lib/conection.rb'
require '../model/super_model.rb'
require '../lib/adapter.rb'
require 'debugger'

class Person < SuperModel
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

  #def create()
  #  person_info = {:name => name, :last_name => last_name, :phone => phone}
  #  id = Adapter.create(self.class.table_name, person_info)
  #end

  def self.find(id)
    person_info = Adapter.find(table_name, id).first
    Person.new({:id => person_info["id"], :name => person_info["name"], :last_name => person_info["last_name"], :phone => person_info["phone"]})
  end

  def self.addresses(id)
    addresses = Address.find_by("id_person", id)
  end

  def destroy()
    Adapter.destroy(Person.table_name, id)
    Person.addresses(id).each do |item|
      address = Address.find(item.id)
      address.destroy
    end
  end  

  def update_attributes()
    person_info = {:name => name, :last_name => last_name, :phone => phone}
    Adapter.update(self.class.table_name, id, person_info)
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