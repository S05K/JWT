class PaymentsController < ApplicationController
  # include JsonWebToken

  def new
  end

  def calculate_total_price
    bus = Bus.find(params[:id])
    selected_seats = params[:seats_ids]
    total_price = bus.calculate_total_price1(selected_seats)
    # render json: { total_price: total_price }
     # headers = request.headers['token'].split(' ').last
     # decoded_token = jwt_decode(headers)
     # if @current_user.present?
      # @current_user.update(bus_id: bus.id)
    # end
  end

  def create
    # headers = request.headers['token'].split(' ').last
    # decoded_token = jwt_decode(headers)

   total_prices = calculate_total_price

  # Parse the JSON response to extract the total_price

  # total_price = JSON.parse(total_price_response.body)

    Stripe.api_key = Rails.configuration.stripe[:secret_key]

    if @current_user.stripe_customer_id.blank?
      customer = Stripe::Customer.create({
        name: @current_user.name,
        email: @current_user.email,
        description: "Customer id: #{@current_user.id}"
      })
      @current_user.update(stripe_customer_id: customer.id)
    else
      customer = Stripe::Customer.retrieve(@current_user.stripe_customer_id)
    end

	
  # payment_intent= Stripe::Checkout::Session.create(payment_method_types: ['card'],line_items: [{price: 'price_1Ogh7iSIVXA0jOhGvccBzI8R',quantity: 1,}],mode: 'subscription', success_url: 'http://localhost:4200/',cancel_url:  'http://localhost:4200/',shipping_address_collection: {allowed_countries: ['US', 'CA', 'GB', 'AU', 'IN'],},)


  payment_intent = Stripe::Checkout::Session.create(
  payment_method_types: ['card'],
  line_items: [
    {
      price_data: {
        currency: 'inr',
        product_data: {
          name: 'Your Product Name',
        },
        unit_amount: total_prices * 100, # Provide the amount dynamically here
      },
      quantity: 1,
    }
  ],
  mode: 'payment', # Use 'payment' mode instead of 'subscription',
  shipping_address_collection: {allowed_countries: ['US', 'CA', 'GB', 'AU', 'IN'],},
  success_url: 'http://localhost:4200/success', # Redirect URL after successful payment
  cancel_url: 'http://localhost:4200/cancel', # Redirect URL if payment is canceled
)

 
  @current_user.update(bus_id: params[:id], selected_seats: params[:seats_ids])

    bus = Bus.find(params[:id])
  bus.disable_paid_seats(params[:seats_ids])

   # PaymentConfirmationMailer.send_confirmation_email(@current_user,bus.number, bus.from, bus.to, bus.arrival, params[:id], params[:seats_ids]).deliver_now
PaymentConfirmationMailer.send_confirmation_email(@current_user, bus.number, bus.from, bus.to, bus.arrival, params[:id], params[:seats_ids]).deliver_now


  render json: {url: payment_intent.url}
  
end

  # def calculate
  #   @bus = Bus.find(params[:id])
    
  # end


 


end







