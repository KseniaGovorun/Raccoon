class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      # t.references :user, null: false, foreign_key: true
      # t.references :tweet, null: false, foreign_key: true
      t.text :body
      t.timestamp :created_at
    end
  end
end
