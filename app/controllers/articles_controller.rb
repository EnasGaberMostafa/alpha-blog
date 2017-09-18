class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end


    def show 
    end

    def create
        debugger
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:notice] = "Article was successfully created" # showed in appplication view
            redirect_to article_path(@article)   #show
        else # validations failed
            render 'new'
        end
    end

    def edit 
    end

    def update 
        if @article.update(articles_params)
            flash[:notice] = "Article was successfully updated" # showed in appplication view
            redirect_to article_path(@article)   #show
        else # validations failed
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Article was successfully deleted"
        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit(:title, :description)
    end
    def set_article
        @article = Article.find(params[:id])         
    end
end