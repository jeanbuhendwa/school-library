require_relative '../book'

describe Book do
  let(:book) { Book.new('The Alchemist', 'Paulo Coelho') }

  it 'should have a title' do
    expect(book.title).to eq('The Alchemist')
  end

  it 'should have an author' do
    expect(book.author).to eq('Paulo Coelho')
  end
end
