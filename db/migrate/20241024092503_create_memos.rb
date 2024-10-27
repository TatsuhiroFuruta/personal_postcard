class CreateMemos < ActiveRecord::Migration[7.2]
  def change
    create_table :memos do |t|
      t.string :title
      t.string :body
      t.string :content_image

      t.timestamps
    end
  end
end