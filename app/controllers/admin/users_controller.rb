module Admin
class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_dashboard_path, notice: 'User was successfully created.'
      else
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end
    
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    def delete
      @user = User.find(params[:id])
      @user.delete
      redirect_to admin_users_path, notice: 'User wass successfully deleted.'
    end  

    private

    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
end