class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title,       null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :tags

      t.timestamps
    end
  end
end
