class BusesController < ApplicationController
  

  def index
    @buses = Bus.all
    render json: {Buses: @buses}
  end

  def get_buses
    arrival_date = Date.parse(params[:arrival])
    @buses = Bus.where(from: params[:from], to: params[:to]).where("DATE(arrival) = ?", arrival_date)
    render json: {Buses: @buses}
  end

  def show
    @bus = Bus.find(params[:id])
    if @bus 
      render json: {Bus: @bus}
    end
  end

  def calculate_total_price
    bus = Bus.find(params[:id])
    selected_seats = params[:seats_ids]
    total_price = bus.calculate_total_price1(selected_seats)
    render json: { total_price: total_price }
     # headers = request.headers['token'].split(' ').last
     # decoded_token = jwt_decode(headers)
     # if @current_user.present?
      # @current_user.update(bus_id: bus.id)
    # end
  end




end
