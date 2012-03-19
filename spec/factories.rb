Factory.define :audio do |f| 
  f.sequence(:title) { |n| "Audio Item #{n}" }
  f.description "This is an audio item"
  f.soundcloud_id "000000"
end

Factory.define :video do |f|
  f.sequence(:title) { |n| "Video Item #{n}" }
  f.description "This is a video item"
  f.youtube_id "000000"
  f.vimeo_id "012345"
end
  
Factory.define :post do |f|
  f.sequence(:title) { |n| "Post #{n}" }
  f.body "This is the post body."
end
  
Factory.define :score do |f|
  include ActionDispatch::TestProcess
  f.sequence(:title) { |n| "Score #{n}" }
  f.description "This is a score description"
  f.asset fixture_file_upload(File.join(Rails.root, 'features', 'support', 'test-upload.pdf'), 'application/pdf')
end

Factory.define :page do |f|
  f.sequence(:title) { |n| "Page #{n}" }
  f.sequence(:text_id) { |n| "page_#{n}" }
  f.content "This is some page content"
end