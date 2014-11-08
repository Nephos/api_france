class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :name, null: false, limit: 45
    end
    add_index :regions, :name
  end
 
  def self.down
    drop_table :regions
  end
end
