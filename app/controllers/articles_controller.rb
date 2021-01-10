class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]
    
    def show
    end

    def index 
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create 
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was created successfully."
        # redirect to show page
        # after saving we have id associated with this new article
        # extract id from @article object
        # use it to form a path
        # redirect_to article_path(@article)
            redirect_to @article
        else # if save fails, want to display the form again
            render 'new'
        end
    end

    def update 
        # update with the changes
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        
        @article.destroy
        redirect_to articles_path 
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
    
end