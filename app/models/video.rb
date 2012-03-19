class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :youtube_id, presence: { unless: "vimeo_id", message: "or Vimeo must be present." }
end
