#encoding: utf-8

require 'yaml'

module ApiFrance
  module Configuration
    CONF_DIR = File.expand_path('config')
    CONF_APP_PATH = [CONF_DIR, 'configuration.yml'].join('/')
    CONF_DB_PATH = [CONF_DIR, 'database.yml'].join('/')

    def self.load!
      Dir.mkdir(CONF_DIR) if not Dir.exists? CONF_DIR
      load_conf!
      load_database!
    end

    # Load a YAML file
    def self.load_file(filename)
      return YAML::load(File.open(filename)) || {} if File.exists? filename rescue return {}
      return {}
    end

    # Load the config/configuration.yml
    def self.load_conf!
      @@all = load_file(CONF_APP_PATH)
      @@all['results_limit'] = (@@all['results_limit'].to_s.to_i.zero? ? 1000 : @all['results_limit'].to_s.to_i)
      return @@all
    end

    def self.load_database!
      @@db = load_file(CONF_DB_PATH)
    end

    def self.reset!
      @@all = nil
      @@db = nil
    end

    def self.all
      load! if @@all.nil?
      return @@all
    end

    def self.db
      load! if @@db.nil?
      return @@db
    end

  end
end
