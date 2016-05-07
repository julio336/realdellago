class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def change
	  change_column :rooms, :date_occupied, 'date USING CAST(date_occupied AS date)'
  	  change_column :rooms, :date_start, 'date USING CAST(date_start AS date)'
  	  change_column :rooms, :date_end, 'date USING CAST(date_end AS date)'
  end


  def self.down
    change_table :rooms do |t|
      t.change :date_occupied, :datetime
      t.change :date_start, :datetime
      t.change :date_end, :datetime
    end
  end
end
