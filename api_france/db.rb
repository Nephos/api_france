#encoding: utf-8

module ApiFrance
  module DB
    DB_DIR = File.expand_path('db')
    MIGRATE_DIR = [DB_DIR, 'migrate'].join('/')

    def self.dir!
      Dir.mkdir DB_DIR unless Dir.exists? DB_DIR
      Dir.mkdir MIGRATE_DIR unless Dir.exists? MIGRATE_DIR
    end

    def self.create!
      dir!
      connect_off
      puts "create db"
      ActiveRecord::Base.connection.create_database(Configuration.all['database']) rescue nil
    end

    def self.drop!
      dir!
      connect_off
      puts "drop db"
      ActiveRecord::Base.connection.drop_database(Configuration.all['database']) rescue nil
    end

    def self.connect_off
      Configuration.load!
      Configuration.all[:database] = nil
      puts "connect off db"
      ActiveRecord::Base.establish_connection config
    end

    def self.connect!
      puts "connect db"
      ActiveRecord::Base.establish_connection Configuration.all
    end

    def self.migrate!
      puts "migrate db"
      ActiveRecord::Migrator.migrate MIGRATE_DIR
    end

  end
end
