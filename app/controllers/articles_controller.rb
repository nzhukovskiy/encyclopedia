#require 'combine_pdf'
class ArticlesController < ApplicationController
  after_action :log_to_json, only: [:create, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",   # Excluding ".pdf" extension.
               template: "articles/show.html.erb",
               encoding: 'utf8',
               layout:'pdf.html'
      end
    end
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
    h = History.create(user_id: session[:current_user_id], article_id: @article.id, action_date: Time.now.getutc, action_type: 2)
    @article.destroy
    #redirect_to root_path
  end
  def show_history
    @article = Article.find(params[:id])
  end
  def show_comments
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
  end
  private
  def article_params
    pp params
    params.require(:article).permit(:title, :body, :birthdate, :deathdate, :birth_country, :birth_place, :death_country, :death_place, :resources, :duties, :columns_data, :coordinates)
  end
  def set_elevation
    coordinates = []
    coordinates += params.require(:article).permit(:coordinates)["coordinates"].split(%r{,\s*})
    res = helpers.elevation_finder("https://api.opentopodata.org/v1/test-dataset?locations=" + coordinates[0] + ',' + coordinates[1])
  end
  def log_to_pdf
    #merged_pdf = CombinePDF.new
    #Article.all.each_with_index do |article, index|
      #single_pdf = WickedPdf.new.pdf_from_url("http://localhost:3000/articles/#{article.id}")
    #single_pdf = WickedPdf.new.pdf_from_string(render_to_string(render("#{article}"), layout: 'pdf.html', encoding: "UTF-8"))
      #render_to_string pdf: "some_file_name#{index}", template: "articles/#{article.id}/show.html.erb", layout:'pdf.html', encoding: "UTF-8"
    #save_path = Rails.root.join('pdfs',"filename#{index}.pdf")
    #File.open(save_path, 'wb') do |file|
    #file << single_pdf
    #end
      #merged_pdf << CombinePDF.parse(single_pdf)
    #end
    article_pdf = render_to_string pdf: "some_file_name", template: "articles/all.html.erb", layout:'pdf.html', encoding: "UTF-8"
    article_text = Article.all.order(:id).as_json
    save_path="/mnt/c/Users/user/Documents/PDFs/Alternate/"
    File.open(save_path + "articles.pdf", 'wb') do |file|
      file << article_pdf
    end
    File.open(save_path + "text_logs/articles.json", 'wb') do |file|
      file << article_text
    end
    history_pdf = render_to_string pdf: "some_file_name", template: "history/all.html.erb", layout:'pdf.html', encoding: "UTF-8"
    history_text = History.all.order(:id).as_json
    #save_path="/mnt/c/Users/user/Documents/PDFs/Alternate/history.pdf"
    File.open(save_path + "history.pdf", 'wb') do |file|
      file << history_pdf
    end
    File.open(save_path + "text_logs/history.json", 'wb') do |file|
      file << history_text
    end
  end
  def log_to_json
    save_path="/mnt/c/Files/Alternate/"
    article_text = Article.all.order(:id).as_json
    File.open(save_path + "text_logs/articles.json", 'wb') do |file|
      file << article_text
    end
    history_text = History.all.order(:id).as_json
    File.open(save_path + "text_logs/history.json", 'wb') do |file|
      file << history_text
    end
  end
end
