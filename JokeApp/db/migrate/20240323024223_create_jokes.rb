class CreateJokes < ActiveRecord::Migration[7.0]
  def change
    create_table :jokes do |t|
      t.text :content
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0

      t.timestamps
    end
  end
end
