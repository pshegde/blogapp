class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
	  #this creates an integer col called 'article_id'
	  t.references :article, index: true
      t.timestamps null: false
    end
  end
end
