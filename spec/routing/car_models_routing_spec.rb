require "rails_helper"

RSpec.describe CarModelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/car_models").to route_to("car_models#index")
    end

    it "routes to #new" do
      expect(:get => "/car_models/new").to route_to("car_models#new")
    end

    it "routes to #show" do
      expect(:get => "/car_models/1").to route_to("car_models#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/car_models/1/edit").to route_to("car_models#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/car_models").to route_to("car_models#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/car_models/1").to route_to("car_models#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/car_models/1").to route_to("car_models#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/car_models/1").to route_to("car_models#destroy", :id => "1")
    end

  end
end
