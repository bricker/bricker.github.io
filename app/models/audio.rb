class Audio < ActiveRecord::Base
  validates :title, presence: true
  validates :soundcloud_id, presence: true
end
