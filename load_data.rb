require 'json'
require_relative 'book'

# Load data from books json file
class LoadDtata
    def self.read_books
        return [] unless File.exist?('books.json')
        file = File.open('books.json')
        available_books = File.read(file)
        json_books = JSON.parse(available_books)
        load_books = []
        json_books.each do |book|
            new_book = Book.new(book['title'], book['author'])
            load_books << new_book
        end
        file.close
        load_books
    end
end
