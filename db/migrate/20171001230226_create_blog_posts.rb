class CreateBlogPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_posts do |t|
      t.text :title
      t.text :content
      t.timestamp :posted_at
      t.string :slug

      t.references :admin

      t.timestamps
    end
  end
end
