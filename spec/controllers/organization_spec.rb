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
      puts "\n-->Organization: #{org.name}\n"
      org.groups.each do |gro|
        puts "---->Group: #{gro.name}\n"
        puts "------>Group People:"
        gro.people.each do |prn|
           puts "#{prn.name},"
        end      
        puts "\n------>Group Skills:"
        gro.skills.each do |skl|
           puts "#{skl.name},"
        end 
      end
      end
      puts "\n---------------------------------------------------------------------------------\n"
    end
  end
end
