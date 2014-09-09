require "rails_helper"

RSpec.describe GroupsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the posts into @groups" do
      
      get :index
      
     puts "\n---------------------------------------------------------------------------------\n"
      group2 = Group.find_by_name("suvarna")
      puts "----->'suvarna' group belongs to: #{group2.organization.name} (orgs)"
     puts "\n---------------------------------------------------------------------------------\n"
    end
  end
end

