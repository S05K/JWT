# app/mailers/payment_confirmation_mailer.rb
class PaymentConfirmationMailer < ApplicationMailer
  def send_confirmation_email(current_user, bus_number, from, to, arrival, bus_id, selected_seats)
    @current_user = current_user
    @bus_number = bus_number
    @from = from
    @to = to
    @arrival = arrival
    @bus_id = bus_id
    @selected_seats = selected_seats

    mail(to: @current_user.email, subject: 'Payment Confirmation')
  end
end
