class AddBrandsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :brands, :string
  end
end
