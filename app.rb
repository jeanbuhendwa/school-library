require_relative 'student'
require_relative 'book'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @books = []
    @peoples = []
  end

  def list_all_books
    @books.each { |book| puts "Title:- #{book.title}   Author:- #{book.author} \n" }
  end

  def list_all_peoples
    @peoples.each do |people|
      puts "[#{people.class.name}] Name:- #{people.name} ID:- #{people.id} Age:- #{people.age} \n"
    end
  end

  def create_teacher(age, specialization, name)
    @peoples << Teacher.new(age, specialization, name: name)
  end

  def create_student(age, name, parent_permission)
    @peoples << Student.new(age, name: name, parent_permission: parent_permission)
  end

  # Create a book based on user inputs
  def create_book(title, author)
    @books << Book.new(title, author)
  end

  # Create a rental based on user input
  def create_rental(book_index, person_index, date)
    Rental.new(@books[book_index], @peoples[person_index], date)
  end

  def list_person_rentals(person_id)
    @peoples.each do |person|
      if person.id == person_id
        puts 'Rentals:-'
        person.rentals.each { |rental| puts "Date #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" }
      end
    end
  end
end
