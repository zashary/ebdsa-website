class AddBackgroundImageUrlToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :background_image_url, :string
  end
end
