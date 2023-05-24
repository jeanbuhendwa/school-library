require 'json'
require_relative 'book'
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
      
end
