class CreateAddPosts < ActiveRecord::Migration
  def change
    create_table :add_posts do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.integer :location_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_reference :add_posts, :user, index: true
    add_reference :add_posts, :location, index: true
    add_reference :add_posts, :category, index: true
  end
end
