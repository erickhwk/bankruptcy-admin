require "rails_helper"

RSpec.describe LawsuitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lawsuits").to route_to("lawsuits#index")
    end

    it "routes to #new" do
      expect(get: "/lawsuits/new").to route_to("lawsuits#new")
    end

    it "routes to #show" do
      expect(get: "/lawsuits/1").to route_to("lawsuits#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lawsuits/1/edit").to route_to("lawsuits#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lawsuits").to route_to("lawsuits#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lawsuits/1").to route_to("lawsuits#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lawsuits/1").to route_to("lawsuits#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lawsuits/1").to route_to("lawsuits#destroy", id: "1")
    end
  end
end
