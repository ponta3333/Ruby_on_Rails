class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end

  def index
  	@user = User.find(current_user.id)
  	@users = User.all
  	@book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       @user.save
       redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

end