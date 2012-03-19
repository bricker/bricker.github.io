namespace :paperclip do
  desc "Remove all attachment files"
  task :remove_all do
    `rm -rf #{Rails.root}/public/scores/*`
  end
end