require 'test_helper'

class BlogPostsControllerTest < ActionDispatch::IntegrationTest
  fixtures :blog_posts
  
  setup do
    @blogs_uri = "/blog"
  end

  test "index" do
    get @blogs_uri
    assert_response :success
  end

  test "show" do 
    get "#{@blogs_uri}/#{blog_posts(:test_blog_post).slug}"
    assert_response :success
  end
end
