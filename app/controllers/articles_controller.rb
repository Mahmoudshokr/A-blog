class ArticlesController < ApplicationController

    def new
        @article = Article.new
    end

    def index
        @article = Article.all
    end
    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:success] = "Article has been created succefully"
            redirect_to article_path(@article)
        else
            render :new, status: 422
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:success] = "Artcle has been updated"
            redirect_to article_path(@article)
        else
            render :edit, status: 422
        end    
    end

    def show
        @article = Article.find(params[:id])
    end   
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:danger] = "Article was successfuly deleted"
        redirect_to articles_path
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :description)
    end
end