class AddRawHtmlToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :raw_html, :boolean, default: false
  end
end
