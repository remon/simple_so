require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
 test "should create article" do
   article=Article.new
   article.user =users(:remon)
   article.title ="Test title "
   article.body ="Test body"
   assert article.save
 end
 test "should find article" do
   article_id =articles(:one).id
   assert_nothing_raised {Article.find(article_id)}
 end
 test "should update article" do 
   article=articles(:one)
   assert article.update_attributes(:title=>"new title")
 end
 test "shoud destroy article" do
   article=articles(:one)
   article.destroy 
   assert_raise(ActiveRecord::RecordNotFound) {Article.find(article.id)}
 end
 test "should not create an article without body" do
   article=Article.new
   assert !article.valid?
   assert article.errors[:body].any?
   assert_equal ["can't be blank"],article.errors[:body]
   assert !article.save
 end
end
