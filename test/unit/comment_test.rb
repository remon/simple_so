require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should create comment" do
    comment=article.comments.new
    article=articles(:one)
    comment.name ="Test name"
    comment.email ="Test email"
    comment.body ="Test body"
    assert comment.save
  end
end
