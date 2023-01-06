class RemoveMakersFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :makers, :string
  end
end
