class RemoveDatesFromRooms < ActiveRecord::Migration
  def change
    remove_column :rooms, :date_occupied, :string
    remove_column :rooms, :date_start, :string
    remove_column :rooms, :date_end, :string
    
  end
end
