# HEROKU
AppConfig = Rails.env == 'production' ? ENV : YAML.load_file("#{Rails.root}/config/secrets.yml")
