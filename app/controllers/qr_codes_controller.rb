class QrCodesController < ApplicationController
  skip_before_action :authenticate_request, only: [:generate]

  #  def generate
  #   user_email = params[:email]
  #   user = User.find_by(email: user_email)
  #   user_info_string = user.to_json
  #   if user_info_string
  #     qr = RQRCode::QRCode.new(user_info_string, size: 20)
  #     send_data qr.as_png.to_s, type: 'image/png', disposition: 'inline'
  #   else
  #     render json: { error: 'User not found' }, status: :not_found
  #   end
  # end

  def generate
    user_email = params[:email]
    user = User.find_by(email: user_email)
    if user.present?
      user_info_string = user.to_json
      qr = RQRCode::QRCode.new(user_info_string, size: 20)
      send_data qr.as_png.to_s, type: 'image/png', disposition: 'inline'
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  private

  def qr_code_params
    params.permit(:email)
  end
end
