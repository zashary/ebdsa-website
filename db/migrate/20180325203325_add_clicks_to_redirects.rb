class AddClicksToRedirects < ActiveRecord::Migration[5.1]
  def change
    add_column :redirects, :clicks, :integer, default: 0
  end
end
