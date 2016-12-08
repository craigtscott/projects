require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'

# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @col_names ||= DBConnection.execute2(<<-SQL).first
      SELECT *
      FROM #{ self.table_name }
      LIMIT 0
    SQL
    @col_names.map { |name| name.to_sym }
  end

  def self.finalize!
    columns.each do |col|
      define_method(col) do
        attributes[col]
      end

      # debugger
      define_method("#{col}=") do |val|
        attributes[col] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table = table_name
    columns

    # ...
  end

  def self.table_name
    @table ||= "#{self}".tableize
    # ...
  end

  def self.all

    rows = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{ self.table_name }
    SQL
    self.parse_all(rows)
  end

  def self.parse_all(results)
    output = []
    results.each do |el|
      output << self.new(el)
    end
    output
  end

  def self.find(id)
    obj = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{ self.table_name }
      WHERE id = #{id}
    SQL

    parse_all(obj).first
  end

  def initialize(params = {})
    params.each do |key, val|
      # debugger
      key = key.to_sym
      raise "unknown attribute '#{key}'" unless self.class.columns.include?(key)
      self.send("#{key}=", val)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.attributes.values
  end

  def insert
    cols = attributes.keys.join(", ")
    ques_marks = []
    attributes.keys.count.times { ques_marks << "?" }
    ques_marks = ques_marks.join(", ")

    DBConnection.execute(<<-SQL, attribute_values)
    INSERT INTO
      #{ self.class.table_name }(#{cols})
    VALUES
      (#{ques_marks})

    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    butes = attributes
    id = attributes[:id]
    butes.delete(:id)
    string = []
    butes.each do |key, val|
      string << [key,"?"].join(" = ")
    end
    strings = string.join(", ")

debugger
    DBConnection.execute(<<-SQL, id)
    UPDATE
      table_name
    SET
      col1 = ?, col2 = ?, col3 = ?
    WHERE
      id = ?

    SQL


    # ...
  end

  def save
    # ...
  end
end
