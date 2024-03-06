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


  # For disabling seats....
# def disable_paid_seats(selected_seats)
#   selected_seats.each do |selected_seat|
#     index = seats.index(selected_seat)
#     if index
#       # Update the status of the selected seat to 'disabled'
#       seats[index] =false
#     end
#   end

#   save
# end

# def disable_paid_seats(selected_seats)
#   selected_seats.each do |selected_seat|
#     byebug
#     seat = seats.find { |s| s['seats_ids'] == selected_seat }
#     seat['disabled'] = true if seat
#   end

#   save
# end

def disable_paid_seats(selected_seats)
  selected_seats.each do |selected_seat|
    if seats.include?(selected_seat)
      seats[seats.index(selected_seat)] << '_disabled'
    end
  end

  save
end



  private

  def generate_seats
    self.seats = ROWS.flat_map { |row| COLUMNS.map { |column| "#{row}#{column}" } }
  end



end
