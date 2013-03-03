require '../lib/conection.rb'
require 'debugger'

class Adapter 
  
  def create (table, fields, values)
    query = "INSERT INTO #{table}(#{fields.join(',')}) VALUES(#{values.map {|x| "'#{x}'"}.join(',')});"
    conect = Conection.new
    conect.send_query(query)
  end

  def find(table, id)
    query = "SELECT FROM #{table} WHERE id = #{id};"
    conect = Conection.new
    conect.send_query(query)    
  end

  def find_all(table)
    query = "SELECT * FROM #{table};"
    conect = Conection.new
    conect.send_query(query)
  end

  def find_by(table, field, value)
    query = "SELECT FROM #{table} WHERE #{field} = #{id};"
    conect = Conection.new
    conect.send_query(query)    
  end

  def destroy(table, id)
    query = "DELETE FROM #{table} WHERE id = #{id};"
    conect = Conection.new
    conect.send_query(query)        
  end

  def update(table, id, fields, values)
    "UPDATE #{table} SET #{field} = #{value} WHERE id = #{id}"
    query = "UPDATE #{table} SET WHERE id = #{id};"
    conect = Conection.new
    conect.send_query(query)    
  end
end