class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :account, index: true
      t.string :title
      t.string :department
      t.datetime :published
      t.datetime :updated
      t.string :url
      t.string :links
      t.text :content

      t.timestamps
    end
  end
end
