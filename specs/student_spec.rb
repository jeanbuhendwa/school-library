require_relative '../student'
require 'date'

describe Student do
  let(:student) { Student.new(21) }

  it 'should have an id' do
    expect(student.id).to be_a(Integer)
  end

  it 'should have a name' do
    expect(student.name).to be_a(String)
  end

  it 'should have an age' do
    expect(student.age).to be_a(Integer)
  end

  it 'should have an empty array of rentals' do
    expect(student.rentals).to be_empty
  end

  it 'should have the correct name' do
    expect(student.correct_name).to eq(student.name)
  end

  it 'should have parent permission' do
    expect(student.parent_permission).to be_truthy
  end

  #   it 'should be able to use services if of age or has parent permission' do
  #     expect(student.can_use_services?).to be_truthy
  #   end

  #   context 'when under age' do
  #     let(:student) { Student.new(17) }

  #     it 'should not be able to use services' do
  #       expect(student.can_use_services?).to be_falsey
  #     end
  #   end

  #   context 'when without parent permission' do
  #     let(:student) { Student.new(18, parent_permission: false) }

  #     it 'should not be able to use services' do
  #       expect(student.can_use_services?).to be_falsey
  #     end
  #   end

  it 'should be able to play hooky' do
    expect(student.play_hooky).to eq('¯(ツ)/¯')
  end

  #   it 'should be able to set a classroom' do
  #     classroom = Classroom.new
  #     student.classroom = classroom
  #     expect(student.classroom).to eq(classroom)
  #   end

  #   it 'should be added to the classroom when setting a classroom' do
  #     classroom = Classroom.new
  #     student.classroom = classroom
  #     expect(classroom.students).to include(student)
  #   end

  #   it 'should not be added to the classroom if the classroom already has them' do
  #     classroom = Classroom.new
  #     student.classroom = classroom
  #     expect(classroom.students.length).to eq(1)
  #   end
end
