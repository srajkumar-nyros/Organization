require "rails_helper"

RSpec.describe Group, :type => :model do
  it "orders by  name" do
    org=Organization.find_by_name("SUV1").id
    lindeman = Group.create!(:name => "suvarna",:organization_id => org)
  end
end
