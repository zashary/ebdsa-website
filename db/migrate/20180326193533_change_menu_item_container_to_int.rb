class ChangeMenuItemContainerToInt < ActiveRecord::Migration[5.1]
  def change
    remove_column :menu_items, :container
    add_column :menu_items, :container, :integer
    MenuItem.update_all container: :header
  end
end
