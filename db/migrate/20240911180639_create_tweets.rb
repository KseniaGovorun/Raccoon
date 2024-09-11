class CreateTweets < ActiveRecord::Migration[7.2]
  def change
    create_table :tweets do |t|
      t.text :body
      # t.references :user, null: false, foreign_key: true
      # t.references :origin, null: false, foreign_key: true
      t.timestamp :created_at
    end
  end
end
