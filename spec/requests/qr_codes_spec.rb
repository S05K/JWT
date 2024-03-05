require 'rails_helper'

RSpec.describe "QrCodes", type: :request do
  describe "GET /generate" do
    it "returns http success" do
      get "/qr_codes/generate"
      expect(response).to have_http_status(:success)
    end
  end

end
