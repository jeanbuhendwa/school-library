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
      
end
