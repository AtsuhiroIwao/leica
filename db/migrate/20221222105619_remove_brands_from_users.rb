class RemoveBrandsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :brands, :string
  end
end
