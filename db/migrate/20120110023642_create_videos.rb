class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string   "title"
      t.text     "description"
      t.integer  "vimeo_id"
      t.string   "youtube_id"
      t.timestamps
    end
  end
end
