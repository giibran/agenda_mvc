require '../lib/conection.rb'
require '../lib/adapter.rb'
require 'debugger'

class Address < SuperModel
	attr_accessor :id_person, :address, :id

	def initialize(address_info)
    @id = address_info[:id]
    @id_person = address_info[:id_person]
    @address = address_info[:address]
	end

  def save()
    
  end

  #def create()
  #  address_info = {:id_person => id_person, :address => address}
  #  id = Adapter.create(self.class.table_name, address_info)
  #end

  def self.table_name
    "address"
  end

  def self.find(id)
    address_info = Adapter.find(Address.table_name, id).first
    Address.new({:id => address_info["id"], :id_person => address_info["id_person"], :address => address_info["address"]})
  end

  def self.find_by(field, value)
    addresses = []
    Adapter.find_by(Address.table_name, field, value).each do |address_info|
      addresses.push(Address.new({:id => address_info["id"], :id_person => address_info["id_person"], :address => address_info["address"]}))
    end
    addresses
  end

  def destroy()
      Adapter.destroy(Address.table_name, id)
  end  

  def update_attributes()
    address_info = {:address => address}
    Adapter.update(self.class.table_name, id, address_info)
  end

  def self.show_all
    address_info = Adapter.find_all(Address.table_name)
    address = []
    address_info.each do |item|
      address_info[:id] = item["id"]
      address_info[:id_person] = item["id_person"]
      address_info[:name] = item["name"]
      addresses.push(Address.new(address_info))
    end
    addresses
  end
end