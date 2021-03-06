class UsersController < ApplicationController
  def index
    @user= current_user
    @users=User.all
    @new_book=Book.new
  end

  def show
    @user=current_user
    @user = User.find(params[:id])
    @books=@user.books
    @new_book=Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
     render :edit
    else
     redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice]='profile update successfully'
     redirect_to books_path
    else
     render :edit
    end
  end

  private

  def user_params
    params.require(:user). permit(:name, :profile_image, :introduction)
  end
end
