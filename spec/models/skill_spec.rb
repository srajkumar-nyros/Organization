require "rails_helper"

RSpec.describe Skill, :type => :model do
  it "orders by  name" do
    gro=Group.where(name: "suvarna").last.id

    Skill.create!(:name => "enjoy",:group_id => gro)

  end
end
