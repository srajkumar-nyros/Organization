require "rails_helper"

RSpec.describe Organization, :type => :model do
  it "orders by  name" do
    Organization.create!(:name => "SUV1", :city => "KKD")
  end
end
