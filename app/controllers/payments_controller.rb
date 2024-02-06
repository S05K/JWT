class PaymentsController < ApplicationController
  include JsonWebToken

  def new
  end

  def create
    headers = request.headers['token'].split(' ').last
    decoded_token = jwt_decode(headers)

    
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

	
  payment_intent= Stripe::Checkout::Session.create(payment_method_types: ['card'],line_items: [{price: 'price_1Ogh7iSIVXA0jOhGvccBzI8R',quantity: 1,}],mode: 'subscription', success_url: 'http://localhost:4200/',cancel_url:  'http://localhost:4200/',shipping_address_collection: {allowed_countries: ['US', 'CA', 'GB', 'AU', 'IN'],},)
  render json: {url: payment_intent.url}
  
end


 


end







