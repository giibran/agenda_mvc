require '../lib/conection.rb'
require 'debugger'

class Adapter 
  
  def self.create (table, fields, values)
    query = "INSERT INTO #{table}(#{fields.join(',')}) VALUES(#{values.map {|x| "'#{x}'"}.join(',')});"
    Conection.send_query(query)
    query = "SELECT * FROM #{table} ORDER BY id DESC LIMIT 1"
    id = Conection.send_query(query)
  end

  def self.find(table, id)
    query = "SELECT * FROM #{table} WHERE id = #{id};"
    Conection.send_query(query)    
  end

  def self.find_all(table)
    query = "SELECT * FROM #{table};"
    Conection.send_query(query)
  end

  def self.find_by(table, field, value)
    query = "SELECT * FROM #{table} WHERE #{field} = #{value};"
    Conection.send_query(query)    
  end

  def self.destroy(table, id)
    query = "DELETE FROM #{table} WHERE id = #{id};"
    Conection.send_query(query)        
  end

  def self.update(table, id, fields, values)
    "UPDATE #{table} SET #{field} = #{value} WHERE id = #{id}"
    query = "UPDATE #{table} SET WHERE id = #{id};"
    Conection.send_query(query)    
  end
end