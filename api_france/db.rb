#encoding: utf-8

module ApiFrance
  module DB
    DB_DIR = File.expand_path('db')
    MIGRATE_DIR = [DB_DIR, 'migrate'].join('/')

    def self.connect_off
      dir!
      config = Configuration.db.tap{|conf| puts conf['database'] = nil}
      puts "connect off db"
      ActiveRecord::Base.establish_connection config
      Configuration.reset!
    end

    def self.connect!
      dir!
      puts "connect db"
      ActiveRecord::Base.establish_connection Configuration.db
    end

    def self.dir!
      Dir.mkdir DB_DIR unless Dir.exists? DB_DIR
      Dir.mkdir MIGRATE_DIR unless Dir.exists? MIGRATE_DIR
    end

    def self.create!
      dir!
      connect_off
      puts "create db"
      ActiveRecord::Base.connection.create_database(Configuration.db['database']) rescue nil
    end

    def self.drop!
      dir!
      connect_off
      puts "drop db"
      ActiveRecord::Base.connection.drop_database(Configuration.db['database']) rescue nil
    end

    def self.migrate!
      dir!
      connect!
      puts "migrate db"
      ActiveRecord::Migrator.migrate MIGRATE_DIR
    end

  end
end
