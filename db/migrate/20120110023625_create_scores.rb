class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :title
      t.text :description
      t.string :score_file_name
      t.string :score_content_type
      t.integer :score_file_size
      t.datetime :score_updated_at
      t.timestamps
    end
  end
end
