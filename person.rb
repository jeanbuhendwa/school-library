require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id, :parent_permission

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, person, date)
    Rental.new(book, person, date)
  end

  def correct_name
    @name
  end

  def parent_permission
    @parent_permission
  end

  def can_use_services?
    of_age || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
