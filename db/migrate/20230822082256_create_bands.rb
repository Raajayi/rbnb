class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.text :description
      t.string :genre
      t.string :photo_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
