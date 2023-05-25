require_relative '../person'

require 'date'

describe Person do
  let(:person) { Person.new(21) }

  it 'should have an id' do
    expect(person.id).to be_a(Integer)
  end

  it 'should have a name' do
    expect(person.name).to be_a(String)
  end

  it 'should have an age' do
    expect(person.age).to be_a(Integer)
  end

  it 'should have an empty array of rentals' do
    expect(person.rentals).to be_empty
  end

  it 'should have the correct name' do
    expect(person.correct_name).to eq(person.name)
  end

  it 'should have parent permission' do
    expect(person.parent_permission).to be_truthy
  end
end
