class Api::SessionsController < ApplicationController
    def create
      # Find user by credentials
      @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
      # Flash errors, if any.
      # Render :new if invalid credentials (give the user another chance to login)
      if @user.nil?
        flash.now[:errors] = ['Invalid username or password.']
        render :new
      else
      # Log them in and redirect them if we find them
        login!(@user)
        redirect_to user_url(@user)
      end
  
    end
  
    def destroy
      logout!

      if logout!
        render {}
      else
        render json: @session.errors.full_messages, status: 404
      end
    end
  end
