class Ticket < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :user_id, presence: true
	validates :starting_bid, presence: true
	validates :admission_type, presence: true
	validates :admission_type, inclusion: { in: %w(Student General),
		message: "Admission Type can only be Student or General"}

	validates :quantity, presence: true
	validates :quantity, inclusion: { in: (1..20),
		message: "please input a value between 1 - 20"}

	validates :buy_price, exclusion: { in: 0..0.9}, if: :start0? 
	validates :starting_bid, exclusion: { in: 0..0.9}, if: :buy0? 

	def start0?
		starting_bid == 0.00
	end

	def buy0?
		buy_price == 0.00
	end

end
