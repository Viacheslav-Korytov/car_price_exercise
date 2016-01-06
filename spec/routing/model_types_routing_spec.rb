require "rails_helper"

RSpec.describe ModelTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/model_types").to route_to("model_types#index")
    end

    it "routes to #new" do
      expect(:get => "/model_types/new").to route_to("model_types#new")
    end

    it "routes to #show" do
      expect(:get => "/model_types/1").to route_to("model_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/model_types/1/edit").to route_to("model_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/model_types").to route_to("model_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/model_types/1").to route_to("model_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/model_types/1").to route_to("model_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/model_types/1").to route_to("model_types#destroy", :id => "1")
    end

  end
end
