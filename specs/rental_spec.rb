require_relative '../rental'

RSpec.describe Rental do
  describe '#details' do
    it 'returns the rental details with custom formatting' do
      book = Book.new('Book Title', 'Author')
      person = Person.new('John Doe')
      date = '2023-05-25'
      rental = Rental.new(book, person, date)

      expected_details = "Book: Book Title by Author\nPerson: Unknown\nDate: 2023-05-25"
      expect(rental.details).to eq(expected_details)
    end
  end
end
