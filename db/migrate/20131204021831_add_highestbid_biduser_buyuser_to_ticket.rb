class AddHighestbidBiduserBuyuserToTicket < ActiveRecord::Migration
  def change
  	add_column :tickets, :buy_user, :integer, default: 0
  	add_column :tickets, :bid_user, :integer, default: 0
  end
end
