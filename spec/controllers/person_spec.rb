require "rails_helper"

RSpec.describe PeopleController, :type => :controller do
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

    it "loads all of the posts into @people" do
      
      get :index
      
     puts "\n----------------------------------------------------------------------------------------\n"
      person = Person.find_by_name("raj")
      puts "----->'raj' is a member in: #{person.group.name} (group) <-> #{person.group.organization.name} (orgs)"
      puts "Skills :" 
      person.skills.each do |skill|      
       puts skill.name
      end
      puts "\n----------------------------------------------------------------------------------------\n"
    end
  end
end
