class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string   :title 
      t.string   :description
      t.text     :body
      t.string   :author
      t.string   :address
      t.datetime :start_at
      t.datetime :finish_at
      t.string   :type

      t.timestamps null: false
    end
  end
end
