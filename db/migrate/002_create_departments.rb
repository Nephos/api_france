class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments, id: false do |t|
      t.string :id, null: false, limit: 3
      t.string :name, null: false, limit: 32
      t.integer :region_id, null: false, limit: 2
    end
    execute "ALTER TABLE departments ADD PRIMARY KEY (id);"
    add_index :departments, :name
    add_index :departments, :region_id
  end
 
  def self.down
    drop_table :departments
  end
end
