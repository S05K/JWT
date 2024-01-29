require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  
  let(:user) { FactoryBot.create(:user) }
     describe 'POST /login' do
      it 'returns a success response' do
        post '/auth/login', params:{email: user.email, password: user.password}
        expect(response).to have_http_status(200)
      end
     end

   describe "POST /login" do 
    it "returns error message when book login fails" do 
       post '/auth/login', params:{email: user.email, password: user.password.to_i}
       expect(response).to have_http_status(404)
    end
   end 

end
