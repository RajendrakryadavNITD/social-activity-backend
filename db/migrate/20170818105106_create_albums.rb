class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :url
      t.integer :add_post_id
      t.integer :type

      t.timestamps null: false
    end
  end
end
