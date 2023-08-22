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
        if @article.save
            flash[:notice] = "Article has been created succefully"
            redirect_to article_path(@article)
        else
            render :new, status: 422
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Artcle has been updated"
            redirect_to article_path(@article)
        else
            render :edit, status: 422
        end    
    end

    def show
        @article = Article.find(params[:id])
    end    
    private
    def article_params
        params.require(:article).permit(:title, :description)
    end
end