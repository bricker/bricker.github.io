class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :title
      t.text :description
      t.integer :soundcloud_id
      t.timestamps
    end
  end
end
