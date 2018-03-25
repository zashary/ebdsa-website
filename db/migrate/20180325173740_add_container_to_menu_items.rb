class AddContainerToMenuItems < ActiveRecord::Migration[5.1]
  def change
    add_column :menu_items, :container, :string

    MenuItem.reset_column_information
    MenuItem.update_all container: 'header'
  end
end
