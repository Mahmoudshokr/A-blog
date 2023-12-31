class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Loged in successfully"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Incorrect email or password"
            render :new , status: 422    
        end
        
        
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = 'logged out!!'
        redirect_to root_path
    end
    

end