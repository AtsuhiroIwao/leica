class AddMakersToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :makers, :string
  end
end
