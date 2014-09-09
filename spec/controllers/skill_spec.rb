require "rails_helper"

RSpec.describe SkillsController, :type => :controller do
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

    it "loads all of the posts into @skills" do
      
      get :index
      
     puts "\n---------------------------------------------------------------------------------------\n"
      skill = Skill.find_by_name("enjoy")
      puts "----->'enjoy' skill belongs to: #{skill.group.name} (group) <-> #{skill.group.organization.name} (orgs)"
      puts "\n--------------------------------------------------------------------------------------\n"
    end
  end
end

