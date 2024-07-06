require "rails_helper"

RSpec.describe TenanciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tenancies").to route_to("tenancies#index")
    end

    it "routes to #new" do
      expect(get: "/tenancies/new").to route_to("tenancies#new")
    end

    it "routes to #show" do
      expect(get: "/tenancies/1").to route_to("tenancies#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tenancies/1/edit").to route_to("tenancies#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tenancies").to route_to("tenancies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tenancies/1").to route_to("tenancies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tenancies/1").to route_to("tenancies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tenancies/1").to route_to("tenancies#destroy", id: "1")
    end
  end
end
