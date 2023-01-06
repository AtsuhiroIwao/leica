class AddMakersToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :makers, :string
  end
end
