class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :indexName
      t.timestamps null: false
    end
  end
end
