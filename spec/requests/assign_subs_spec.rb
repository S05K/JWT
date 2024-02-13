require 'rails_helper'
require 'jwt'
include JsonWebToken
extend ActiveSupport::Concern
RSpec.describe "AssignSubs", type: :request do
   
    describe 'GET #index' do
    user = FactoryBot.create(:user)
    let(:token) { jwt_encode(user_id: user.id) }
    let(:subcsriptions) { FactoryBot.create_list(:subcsription, 3) }
    let(:assign_sub) { FactoryBot.create(:assign_sub, user: user) }

    before do
      headers = { 'token' => token }
      get '/assign_subs', headers: headers
    end

    it 'returns the user\'s subscriptions' do
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      end
    end

end
