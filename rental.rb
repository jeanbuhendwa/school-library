class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def details
    "Book: #{@book.title} by #{@book.author}\nPerson: Unknown\nDate: #{@date}"
  end
end
