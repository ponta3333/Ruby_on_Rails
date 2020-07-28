class BooksController < ApplicationController
  def top
  end

  def index
  	@books = Book.all
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	@books = Book.all
  	if @book.save
  		flash[:notice] = "Book was successfully created."
  		redirect_to book_path(@book.id)
  	else
  		render :index
  	end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
    @book.user_id = current_user_id
  	if @book.update(book_params)
  		flash[:notice] = "Book was successfully updated."
  		redirect_to book_path(@book.id)
  	else
  		render :edit
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end
end
