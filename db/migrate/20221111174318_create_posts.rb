class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.integer :user_id
      t.text :body
      t.string :post_image
    end
  end
end
