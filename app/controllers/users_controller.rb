class UsersController < ApplicationController
    def new
        @user = User.new()
    end

    def create
        if User.new(user_params).valid?
            @user = User.create(user_params)
            session[:user_id] = @user.id
        else
            redirect_to new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end