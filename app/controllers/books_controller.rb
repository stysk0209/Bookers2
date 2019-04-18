class BooksController < ApplicationController

	def home
	end

	def about
	end

	def index
		@books = Book.all
		@book_new = Book.new
		@user = current_user
	end

	def create
		book = Book.new(book_params)
		book.user_id = current_user.id
		book.save
		flash[:notice] = "Book was successfully created."
		redirect_to book_path(book.id)
	end

	def show
		@book_new = Book.new
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to book_path(book)
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:book_title, :book_body, :user_id)
	end
	def user_params
		params.require(:user).permit(:name, :image)
	end

end
