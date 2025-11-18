require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "validates required fields" do
    post = Post.new
    assert_not post.valid?

    post.title = "Titulo"
    assert_not post.valid?

    post.content = "Content"
    assert post.valid?
  end
end
