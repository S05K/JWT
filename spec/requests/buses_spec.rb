require 'rails_helper'

RSpec.describe "Buses", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/buses/index"
      expect(response).to have_http_status(:success)
    end
  end

end
