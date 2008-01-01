class AddModelGlobals < ActiveRecord::Migration
  def self.up
    create_table :globals do |t|
      t.column :gkey, :string 
      t.column :gvalue, :string 
    end    
  end

  def self.down
    drop_table :globals
  end
end
