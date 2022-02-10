class UsersController < ApplicationController

    def index
        @users = User.all
        render :index
    end

    def show
        render json: 'Some String'
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(username: params[:user][:username], password: params[:user][:password])
        if @user.save
            redirect_to user_url(@user.id)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_url
        end
    end


end