class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :name, null: false, limit: 45
      t.string :zipcode, null: false
      t.string :department_id, :null => false, limit: 2
      t.integer :region_id, :null => false, limit: 1
      t.decimal :longitude
      t.decimal :latitude
    end
    add_index :cities, :name
    add_index :cities, :zipcode
    add_index :cities, [:department_id, :region_id]
  end
 
  def self.down
    drop_table :cities
  end
end
