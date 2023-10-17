class DropHomes < ActiveRecord::Migration[5.1]
  def change
    drop_table :homes
  end
end
