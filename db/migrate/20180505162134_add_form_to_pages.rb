class AddFormToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :show_form, :boolean, default: false, null: false
    add_column :pages, :form_tags, :string
  end
end
