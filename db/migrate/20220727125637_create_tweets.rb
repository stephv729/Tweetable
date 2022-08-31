class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
