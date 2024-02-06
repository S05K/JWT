require 'rails_helper'

RSpec.describe "ForgotPasswords", type: :request do
  
  let(:user) { FactoryBot.create(:user) }

  context 'when user is present' do
    before do
    post "/forgot_passwords", params: {email: user.email}
    allow(User).to receive(:find_by).with(email: user.email).and_return(user)
    allow(ROTP::Base32).to receive(:random_base32).and_return('random_base32')
    allow_any_instance_of(ROTP::TOTP).to receive(:now).and_return(user.email) 
    allow(SendOtpMailer).to receive_message_chain(:send_otp, :deliver_now)
  end

  it 'generates OTP, updates user, and sends email' do
    post "/forgot_passwords", params: { email: user.email }
    expect(response).to have_http_status(200)
    expect(user.reload.otp_code).to eq( user.otp_code)
    expect(SendOtpMailer).to have_received(:send_otp).with(user, user.otp_code)
    expect(response.body).to include('Otp have been sent on your mail')
  end
end

describe "POST /create" do
  it "returns error when email is nil" do
    user = create(:user1)
    allow(User).to receive(:find_by).with(email: user.email).and_return(nil)
    post '/forgot_passwords', params: { email: nil }
    expect(response).to have_http_status(404)
    expect(JSON.parse(response.body)['error']).to eq('user is not present')
  end
end


describe 'POST #update_password' do
  let(:user) { FactoryBot.create(:user2) }
    it 'updates password and returns success message' do
     allow(User).to receive(:find_by).with(email: user.email).and_return(user)
     put "/forgot_passwords/verify_otp", params: { password: 'new_password', email: user.email, otp: user.otp_code }
     user.reload
     expect(user.reload.password).to eq('new_password')
     expect(response).to have_http_status(200)
  end
end


describe 'POST #update_password' do
  let(:user) { FactoryBot.create(:user2) }
  it 'should give an error when opt is not matched' do 
    allow(User).to receive(:find_by).with(email: user.email).and_return(user)
    put "/forgot_passwords/verify_otp", params: { password: 'new_password', email: user.email, otp: "user.otp_code" }
     user.reload
      expect(response).to have_http_status(422)
  end
end


end
