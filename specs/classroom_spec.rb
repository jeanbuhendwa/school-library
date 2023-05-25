require_relative '../classroom'

describe Classroom do
  let(:classroom) { Classroom.new('Math') }
  let(:student1) { Person.new('John Doe') }
  let(:student2) { Person.new('Jane Doe') }

  it 'should have a label' do
    expect(classroom.label).to eq('Math')
  end

  it 'should have an empty array of students' do
    expect(classroom.students).to be_empty
  end
end
