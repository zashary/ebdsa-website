class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.text :title
      t.text :content
      t.string :slug

      t.boolean :show_in_menu
      t.integer :parent_id

      t.references :admin

      t.timestamps
    end
  end
end
