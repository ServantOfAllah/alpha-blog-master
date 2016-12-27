class SessionsController < ApplicationController
    def new
        
    end
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id #saving the model user id to the browser session user ID
            flash[:success] = "you have successfully logged in"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Incorrect login information"
            render 'new'
        end
    end
        
    def destroy
        session[:user_id] = nil
        flash[:success] = "You have successfully log out"
        redirect_to root_path
    end
end
    