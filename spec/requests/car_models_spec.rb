require 'rails_helper'

RSpec.describe "CarModels", type: :request do
  describe "GET /car_models" do
    it "works! (now write some real specs)" do
      get car_models_path
      expect(response).to have_http_status(200)
    end
  end
end
