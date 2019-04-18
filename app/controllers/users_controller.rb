class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@book_new = Book.new
		@books = @user.books
	end

	def index
		@user = current_user
		@book_new = Book.new
		@users = User.all
	end

	def edit
		@user = current_user
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		flash[:notice] = "Book was successfully updated."
		redirect_to user_path(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:name, :image, :body)
	end

end
