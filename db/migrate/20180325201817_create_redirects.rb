class CreateRedirects < ActiveRecord::Migration[5.1]
  def change
    create_table :redirects do |t|
      t.string :from_path
      t.string :to_url

      t.timestamps
    end
  end
end
