require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    login_as(:remon)
    get :new
    assert_response :success
  end

  test "should create article" do
    login_as(:remon)
assert_difference('Article.count') do
  post:create,:article=>{:title=>"Pots man",:body=>"luren man"}
end
assert_response :redirect
assert_redirected_to profile_path(assigns(:profile))
end

  test "should show article" do
    get :show, :id => @article.to_param
    assert_response :success
    assert_template 'show'
    assert_not_nil assigns(:article)#not articles like in index action 
    assert assigns(:article).valid?
  end

  test "should get edit" do
    get :edit, :id => @article.to_param
    assert_response :success
  end

  test "should update article" do
    login_as(:remon)
    put :update, :id => @article.to_param, :article => {:title=>"hello",:body=>"I like to swimmm"}
    assert_redirected_to :controller=>"profiles",:action=>"show",:id=>[:user.profile]
  end

  test "should destroy article" do
    login_as(:remon)
    assert_nothing_raised {Article.find(@article.to_param)}
    assert_difference('Article.count', -1) do
      delete :destroy, :id => @article.to_param
    end
    assert_redirected_to profile_path(assigns(:profile))
  
  end
end
