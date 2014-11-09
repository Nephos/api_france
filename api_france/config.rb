#encoding: utf-8

require 'yaml'

module ApiFrance
  module Configuration
    CONF_DIR = File.expand_path('conf')
    CONF_PATH = [CONF_DIR, 'conf.yml'].join('/')

    def self.load!
      Dir.mkdir(CONF_DIR) if not Dir.exists? CONF_DIR
      return false if not File.exists? CONF_PATH
      @@all ||= YAML::load(File.open(CONF_PATH))
      @@all['results_limit'] = (@@all['results_limit'].to_s.to_i.zero? ? 1000 : @all['results_limit'].to_s.to_i)
      return @@all
    end

    def self.all
      load! if @@all.nil?
      return @@all
    end

  end
end
ApiFrance::Configuration.load!
