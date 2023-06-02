class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.references :library, foreign_key: true
      t.references :author, foreign_key: true
      t.references :genre, foreign_key: true
      t.timestamps
    end
  end
end
