class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.belongs_to :user, foreign_key: true
      t.belongs_to :city, foreign_key: true

      t.timestamps
    end
  end
end
