class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def create
        # render plain: params[:article].inspect
        @article = Article.new(articles_params)
         
        if @article.save
            flash[:notice] = "Article was successfully created" # showed in appplication view
            redirect_to article_path(@article)  
        else # validations failed
            render 'new'
        end
    end

    def show 
         @article = Article.find(params[:id])
    end

    private
    def articles_params
        params.require(:article).permit(:title, :description)
    end
end