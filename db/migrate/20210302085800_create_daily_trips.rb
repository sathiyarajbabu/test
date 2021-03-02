class CreateDailyTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_trips do |t|
      t.integer :row
      t.integer :column
      t.integer :seat_number
      t.string :name
      t.datetime :date
      t.timestamps
    end
  end
end
