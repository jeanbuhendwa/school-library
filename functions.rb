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
      app.create_book
    when 5
      app.create_rental
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

  # Create a book based on user inputs
  def create_book
    puts 'Title:-'
    title = gets.chomp
    puts 'Author:-'
    author = gets.chomp
    @books << Book.new(title, author)
  end

  # Create a rental based on user input
  def create_rental
    puts 'Select a book from the following list by number'
    @books.each.with_index { |book, idx| puts "#{idx}) Book #{book.title} by #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number(not ID)'
    @peoples.each.with_index do |person, idx|
      puts "#{idx}) [#{person.class.name}] Name #{person.name}, ID #{person.id}, Age #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date:-'
    date = gets.chomp
    Rental.new(@books[book_index], @peoples[person_index], date)
  end
end
