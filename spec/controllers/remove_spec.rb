require "rails_helper"

RSpec.describe OrganizationsController, :type => :controller do
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

    it "loads all of the posts into @organizations" do
      
      get :index
      
     puts "\n---------------------------------------------------------------------------------\n"
      orgs = Organization.all
      orgs.each do |org|
        org.destroy
      end
      puts "Everything is Deleted....."
      puts "\n---------------------------------------------------------------------------------\n"
    end
  end
end
