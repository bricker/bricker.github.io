class ChangePaperclipNameOnScores < ActiveRecord::Migration
  def up
    remove_column :scores, :score_file_name
    remove_column :scores, :score_file_size
    remove_column :scores, :score_content_type
    remove_column :scores, :score_updated_at
    
    add_column :scores, :asset_file_name, :string
    add_column :scores, :asset_file_size, :integer
    add_column :scores, :asset_content_type, :string
    add_column :scores, :asset_updated_at, :datetime    
  end

  def down
    remove_column :scores, :asset_file_name
    remove_column :scores, :asset_file_size
    remove_column :scores, :asset_content_type
    remove_column :scores, :asset_updated_at
    
    add_column :scores, :score_file_name, :string
    add_column :scores, :score_file_size, :integer
    add_column :scores, :score_content_type, :string
    add_column :scores, :score_updated_at, :datetime
  end
end
