
class Book
  attr_reader :title, :author, :status
  attr_accessor :id

  def initialize(title, author)
    @title = title
    @author = author
    @id = nil
    @status = "available"
  end

  def check_out
    if @status == "checked_out"
      return false
    else
      @status = "checked_out"
      return true
    end
  end

  def check_in
    @status = "available"
  end

end

class Borrower
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Library
  attr_reader :name
  attr_accessor :books

  def initialize(name)
    @name = name
    @books = []
    @book_count = 111111
    @checked_out_books = {}
    @borrowed = {}
  end

  def register_new_book(title, author)
    book = Book.new(title, author)
    book.id = @book_count
    @book_count += 1
    @books << book
  end

  def check_out_book(book_id, borrower)
    
    if @checked_out_books.values.count(borrower) == 2
      return nil
    else
      book = @books.find { |x| x.id == book_id }
        if book.nil?
          return "couldn't find book"
        end

        if book.status == "checked_out"
          return nil
        end

      book.check_out
      @checked_out_books[book.id] = borrower
      book
    end

  end

  def get_borrower(book_id)
    @checked_out_books[book_id].name
  end

  def check_in_book(book)
    @checked_out_books.delete(book)
    book.check_in
  end

  def available_books
    @books.select { |a| a.status == "available" }
  end

  def borrowed_books
    
  end
end
