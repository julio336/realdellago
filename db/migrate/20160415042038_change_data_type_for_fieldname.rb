class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def change
	  change_column :rooms, :date_occupied, "USING date_occupied::date"
  	  change_column :rooms, :date_start, "USING date_start::date"
  	  change_column :rooms, :date_end, "USING date_end::date"
  end


  def self.down
    change_table :rooms do |t|
      t.change :date_occupied, :datetime
      t.change :date_start, :datetime
      t.change :date_end, :datetime
    end
  end
end
