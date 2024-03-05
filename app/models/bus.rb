class Bus < ApplicationRecord
  # belongs_to :user, optional: true
	serialize :seats, Array

  

  

	ROWS = ('A'..'J').to_a
  	COLUMNS = (1..2).to_a

  before_create :generate_seats
  
  def calculate_total_price1(selected_seats)
    total_price = 0
    selected_seats.each do |seat_id|
      total_price += price  #if seats.include?(seat_id)
    end
    total_price
  end

  private

  def generate_seats
    self.seats = ROWS.flat_map { |row| COLUMNS.map { |column| "#{row}#{column}" } }
  end



end
