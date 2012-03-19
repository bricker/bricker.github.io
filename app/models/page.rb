class Page < ActiveRecord::Base
  validates :text_id, uniqueness: true, presence: true
  attr_protected :text_id
  
  def to_param
    "#{text_id}"
  end
end
