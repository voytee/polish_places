class CreatePlaces < ActiveRecord::Migration

  def self.up
    create_table :places do |t|
      t.references :province
      t.string :gender_code, :limit =>2
      t.string :name, :limit => 128
    end
    add_index :places, [:province_id]
    add_index :places, [:name]    
    add_index :places, [:name, :gender_code]
    add_index :places, [:province_id, :name]
    add_index :places, [:province_id, :name, :gender_code]
    
    sql = File.open('vendor/plugins/polish_places/lib/places.sql')
    sql.each_line do |line|
      execute line.rstrip
    end
  end

  def self.down
    remove_index :places, :province_id    
    remove_index :places, :name    
    remove_index :places, :name_and_gender_code
    remove_index :places, :province_id_and_name
    remove_index :places, :province_id_and_name_and_gender_code
    drop_table :places
  end

end
