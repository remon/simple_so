class CommentsController < ApplicationController
  before_filter :load_article ,:except=>:destroy
  before_filter :authenticate_user! ,:only=>:destroy
  #before_filter :load_user 
  def create 
    
    @comment=@article.comments.new(params[:comment])   
    @user_who_commented =current_user 
    if @comment.save 
  
    
     redirect_to @article,:notice=>"thanks for commenting" 
    else
      redirect_to @article ,:alert=>"unable to comment"
    end
    end
 
 
  def destroy 
    @article = current_user.articles.find(params[:article_id])
    @comment=@article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article,:notice=>"comment deleted"
  end
  private
  def load_article
    @article=Article.find(params[:article_id])
  end
 
end
