class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def self.up
    change_table :rooms do |t|
      t.change :date_occupied, 'ALTER TABLE :date_occupied ALTER COLUMN :date_time type :date USING to_date(date_time)'
      t.change :date_start, 'ALTER TABLE :date_occupied ALTER COLUMN :date_time type :date USING to_date(date_time)'
      t.change :date_end, 'ALTER TABLE :date_occupied ALTER COLUMN :date_time type :date USING to_date(date_time)'
    end
  end
  def self.down
    change_table :rooms do |t|
      t.change :date_occupied, :datetime
      t.change :date_start, :datetime
      t.change :date_end, :datetime
    end
  end
end
