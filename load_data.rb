require 'json'
require_relative 'book'

# Load data from books json file
class LoadData
    def self.read_books
        return [] unless File.exist?('books.json')
        File.open('books.json') do |file|
          available_books = file.read
          json_books = JSON.parse(available_books)
          load_books = []
          json_books.each do |book|
            new_book = Book.new(book['title'], book['author'])
            load_books << new_book
          end
          load_books
        end
      end

      def self.read_people
        return [] unless File.exist?('people.json')
        File.open('people.json') do |file|
          available_people = file.read
          json_people = JSON.parse(available_people)
          load_people = []
          json_people.each do |person|
            new_person = Person.new(person['age'], name: person['name'], parent_permission: person['parent_permission'])
            load_people << new_person
          end
          load_people
        end
      end
      
      def self.read_rentals(books, people)
        return [] unless File.exist?('rentals.json')
    
        File.open('rentals.json') do |file|
          available_rentals = file.read
          json_rentals = JSON.parse(available_rentals)
          load_rentals = []
    
          json_rentals.each do |rental|
            book = books.find { |b| b.title == rental['book_title'] && b.author == rental['book_author'] }
            person = people.find { |p| p.name == rental['person_name'] && p.id == rental['person_id'] }
            next unless book && person
    
            new_rental = Rental.new(book, person, rental['date'])
            load_rentals << new_rental
          end
    
          load_rentals
        end
      end
end
