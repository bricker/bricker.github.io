class Score < ActiveRecord::Base
  validates :title, presence: true
  validates_attachment_presence :asset
  validates_attachment_content_type :asset, content_type: 'application/pdf', unless: "asset.blank?"
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_asset, if: :cropping?
  
  production = Rails.env == 'production'
  asset_path = "/scores/#{Rails.env}/:id/:style/:basename.:extension"
  
  # HEROKU
  has_attached_file :asset,
                    storage: production ? :s3 : :filesystem,
                    s3_credentials: { access_key_id: AppConfig["s3_key"], secret_access_key: AppConfig["s3_secret"] },
                    url: asset_path,
                    bucket: 'bryanricker',
                    styles: { 
                      thumb: {
                        geometry: "125x", 
                        format: 'png',
                        processors: [:cropper] 
                      }, 
                      full: {
                        geometry: "100%",
                        format: 'png'
                      }
                    }   
       
  def cropping?
    crop_x.present? && crop_y.present? && crop_w.present? && crop_h.present?
  end
  
  def asset_geometry(style = :full)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(asset.to_file(style))
  end
                  
  private
    def reprocess_asset
      asset.reprocess!
    end
end
