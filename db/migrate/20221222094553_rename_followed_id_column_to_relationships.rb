class RenameFollowedIdColumnToRelationships < ActiveRecord::Migration[6.1]
  def change
    rename_column :relationships, :followed_id, :following_id
  end
end
