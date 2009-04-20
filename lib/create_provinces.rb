class CreateProvinces < ActiveRecord::Migration
  def self.up
    create_table :provinces do |t|
      t.string :name, :limit =>32
      t.string :code, :limit =>2
    end

    sql = File.open('vendor/plugins/polish_places/lib/provinces.sql')
    sql.each_line do |line|
      execute line.rstrip
    end
    
  end
  
  def self.down
    drop_table :provinces
  end
end
