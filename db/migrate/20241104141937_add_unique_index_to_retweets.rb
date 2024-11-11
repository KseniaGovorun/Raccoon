class AddUniqueIndexToRetweets < ActiveRecord::Migration[7.2]
  def change
    add_index :tweets, [ :user_id, :origin_id ], unique: true, where: "origin_id IS NOT NULL"
  end
end
