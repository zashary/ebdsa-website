class AddVisbileToPagesAndBlog < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :listed, :boolean, default: true
    add_column :blog_posts, :listed, :boolean, default: true
  end
end
