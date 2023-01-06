class AddBrandsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :brands, :string
  end
end
