require_relative 'app'

class Functions
  def create_person(app)
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:'
    option = gets.chomp
    parent_permission = true
    puts 'age:'
    age = gets.chomp.to_i
    puts 'name:'
    name = gets.chomp

    case option.to_i
    when 1
      puts 'Has parent permission?[Y/N]'
      val = gets.chomp
      parent_permission = false if %w[N n NO no No].include?(val)
      app.create_student(age, name, parent_permission)
    when 2
      puts 'specialization:'
      specialization = gets.chomp
      app.create_teacher(age, specialization, name)
    else
      puts 'Invalid input :('
    end
  end

  def handle_option(option, app)
    case option
    when 3
      create_person(app)
    when 4
      create_book(app)
    when 5
      create_rental(app)
    when 6
      puts 'Enter person ID:'
      id = gets.chomp.to_i
      app.list_person_rentals(id)
    when 7
      puts 'Thanks :)..'
      return false
    else
      puts 'Invalid number :('
    end
    true
  end

  def create_book(app)
    puts 'Title:-'
    title = gets.chomp
    puts 'Author:-'
    author = gets.chomp
    app.create_book(title, author)
  end

  def create_rental(app)
    puts 'Select a book from the following list by number'
    app.list_all_books.each.with_index { |book, idx| puts "#{idx}) Book #{book.title} by #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number(not ID)'
    app.list_all_peoples.each.with_index do |person, idx|
      puts "#{idx}) [#{person.class.name}] Name #{person.name}, ID #{person.id}, Age #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date:-'
    date = gets.chomp
    app.create_rental(book_index, person_index, date)
  end
end

def list_option
  puts ''
  puts '1 - List all books.'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def main
  status = true
  app = App.new
  functions = Functions.new
  while status
    list_option
    option = gets.chomp.to_i
    if option == 1
      app.list_all_books
    elsif option == 2
      app.list_all_peoples
    else
      status = functions.handle_option(option, app)
    end
  end
end

main
