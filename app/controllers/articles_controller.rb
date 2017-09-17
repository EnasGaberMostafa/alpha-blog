class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end


    def show 
        @article = Article.find(params[:id])
   end

    def create
        # render plain: params[:article].inspect
        @article = Article.new(articles_params)
         
        if @article.save
            flash[:notice] = "Article was successfully created" # showed in appplication view
            redirect_to article_path(@article)   #show
        else # validations failed
            render 'new'
        end
    end

    def edit 
        @article = Article.find(params[:id]) 
    end

    def update 
        @article = Article.find(params[:id])
        if @article.update(articles_params)
            flash[:notice] = "Article was successfully updated" # showed in appplication view
            redirect_to article_path(@article)   #show
        else # validations failed
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article was successfully deleted"
        redirect_to articles_path
    end

    private
    def articles_params
        params.require(:article).permit(:title, :description)
    end
end