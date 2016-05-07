class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.boolean :status
      t.string :type
      t.time :date_occupied
      t.integer :price
      t.string :adult
      t.string :kid
      t.time :date_start
      t.time :date_end
      t.timestamps null: false
      t.belongs_to :user, index:true
      t.datetime :order_date
      t.timestamps null: false
    end
  end
end
