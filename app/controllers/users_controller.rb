class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
       @user = User.new(user_params)
       if @user.save
        flash[:success] = "Welcome to alpha blog #{@user.username}"
        redirect_to articles_path
       else
        render :new, status: 422
       end 
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         flash[:success] = "your profile has been updated successfully"
         redirect_to articles_path
      else
         render :edit, status: 422
      end
    end

    def show
      @user = User.find(params[:id])
      @user_articles=@user.articles.paginate(page: params[:page],per_page: 5)
    end

    def index
      @user = User.paginate(page: params[:page], per_page: 5)
    end
    
    
    
    

    private
    def user_params
       params.require(:user).permit(:username, :email , :password) 
    end
  
  end
  