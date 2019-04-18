class UsersController < ApplicationController

before_action :authenticate_user!

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
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "User info was successfully updated."
			redirect_to user_path(params[:id])
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :image, :body)
	end

end
