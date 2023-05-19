require './person'

class Teacher < Person
  attr_reader :age, :specialization, :name

  def initialize(age, specialization, name:)
    super(age)
    @specialization = specialization
    @name = name
  end

  def can_use_services?
    true
  end
end
