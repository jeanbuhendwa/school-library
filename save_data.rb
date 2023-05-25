require 'json'
require_relative 'book'
require_relative 'person'
require_relative 'load_data'

# Save books into books json file
class SaveData
    def self.save_books(books)
        new_book = books.each_with_index.map do |book, index|
          { title: book.title, author: book.author, index: index }
        end
        json_book = JSON.generate(new_book)
        File.write('books.json', json_book)
      end

      def self.save_people(people)
        new_people = people.each_with_index.map do |person, index|
          { age: person.age, name: person.name, id: index, parent_permission: person.parent_permission }
        end
        json_people = JSON.generate(new_people)
        File.write('people.json', json_people)
      end

      def self.save_rentals(rentals)
        existing_rentals = []
        existing_rentals = read_existing_rentals if File.exist?('rentals.json')
        all_rentals = existing_rentals + rentals.map { |rental| rental_to_hash(rental) }
    
        json_rentals = JSON.generate(all_rentals)
        File.write('rentals.json', json_rentals)
      end
    
      def self.rental_to_hash(rental)
        {
          date: rental.date,
          book_title: rental.book.title,
          book_author: rental.book.author,
          person_name: rental.person.name
        }
      end
    
      def self.read_existing_rentals
        file_content = File.read('rentals.json')
        JSON.parse(file_content)
      end
end
