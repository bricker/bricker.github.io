require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  require 'cucumber/rails'
  require 'database_cleaner'
  require 'database_cleaner/cucumber'
  require 'cucumber/rspec/doubles'
  
  Cucumber::Rails::Database.javascript_strategy = :truncation
  include Factory::Syntax::Methods
  
  Capybara.default_selector = :css
  ActionController::Base.allow_rescue = false
  
  begin
    DatabaseCleaner.strategy = :truncation
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end
  
  Before do
    DatabaseCleaner.start
  end
  
  After do |scenario|
    DatabaseCleaner.clean
    `rm -rf #{"#{Rails.root}/public/scores/test/"}`  #remove paperclip files
  end
end

Spork.each_run do
  FactoryGirl.reload
  Bryanricker::Application.reload_routes!
end
