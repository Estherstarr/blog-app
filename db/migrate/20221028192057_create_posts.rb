class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :comments_counter, null: false, default: 0
      t.integer :likes_counter, null: false, default: 0
      t.references :author, null: false, forgn_key: { to_table: :users }

      t.timestamps
    end
  end
end
