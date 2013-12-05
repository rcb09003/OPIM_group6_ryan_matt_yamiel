class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.string :title
      t.string :event_type
      t.string :admission_type
      t.datetime :event_time
      t.string :location
      t.decimal :starting_bid
      t.decimal :buy_price
      t.datetime :bid_end
      t.string :comments

      t.timestamps
    end
  end
end
