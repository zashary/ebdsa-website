class BlogPostsControllerTest < ActionDispatch::IntegrationTest

  def test_index
    get "blog"
    assert_response :success
  end
end