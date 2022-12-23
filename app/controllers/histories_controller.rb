class HistoriesController < ApplicationController
  def show
    @history = History.find(params[:id])

    if Article.exists?(@history.article_id)
      @article = Article.find(@history.article_id)
    else
      @article = ArchivedArticle.find(History.find_by(article_id: @history.article_id, action_type: 2).previous_archived_id)
    end
    if @history.previous_archived_id != nil && @history.next_archived_id != nil
      @next_archived = ArchivedArticle.find(@history.next_archived_id)
      @previous_archived = ArchivedArticle.find(@history.previous_archived_id)
      @body_diff = @next_archived.body.length - @previous_archived.body.length
      @previous_history = History.where(next_archived_id: @history.previous_archived_id).first
      @next_history = History.where(previous_archived_id: @history.next_archived_id).first
    elsif @history.previous_archived_id == nil && @history.next_archived_id != nil
      @next_history = History.where(previous_archived_id: @history.next_archived_id).first
    elsif @history.previous_archived_id != nil && @history.next_archived_id == nil
      @previous_archived = ArchivedArticle.find(@history.previous_archived_id)
      @previous_history = History.where(next_archived_id: @history.previous_archived_id).first
      if @history.action_type == 2
        @article = ArchivedArticle.find(History.find_by(article_id: @history.article_id, action_type: 2).previous_archived_id)
      else
        @article = Article.find(@history.article_id)
        @next_archived = @article
        @body_diff = @next_archived.body.length - @previous_archived.body.length
      end

    end




    #if @history.previous_archived_id != nil
    #  @previous_archived = ArchivedArticle.find(@history.previous_archived_id)
    # if Article.exists?(@history.article_id)
    #    @next_archived = Article.find(@history.article_id)
    #  end
    #  if @history.next_archived_id != nil && @previous_archived != nil
    #    @next_archived = ArchivedArticle.find(@history.next_archived_id)
    #  end
    #  @body_diff = @next_archived.body.length - @previous_archived.body.length
    #  @previous_history = History.where(next_archived_id: @history.previous_archived_id).first
    #end
    #if @history.next_archived_id != nil
    #  @next_history = History.where(previous_archived_id: @history.next_archived_id).first
    #end

  end
end
