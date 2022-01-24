class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.coordinates != ""
      @article.elevation = set_elevation
    end



    if @article.save
      h = History.create(user_id: session[:current_user_id], article_id: @article.id, action_date: Time.now.getutc, action_type: 0)
      #pp h
      #h.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if params.require(:article).permit(:coordinates)["coordinates"] != ""
      @article.elevation = set_elevation
    end

    if @article.update(article_params)
      h = History.create(user_id: session[:current_user_id], article_id: @article.id, action_date: Time.now.getutc, action_type: 1)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  def show_history
    @article = Article.find(params[:id])
  end
  private
  def article_params
    params.require(:article).permit(:title, :body, :birthdate, :deathdate, :birth_country, :birth_place, :death_country, :death_place, :resources, :duties, :columns_data, :coordinates)
  end
  def set_elevation
    coordinates = []
    coordinates += params.require(:article).permit(:coordinates)["coordinates"].split(%r{,\s*})
    res = helpers.elevation_finder("https://api.opentopodata.org/v1/test-dataset?locations=" + coordinates[0] + ',' + coordinates[1])
  end
end
