require "rails_helper"

RSpec.describe Person, :type => :model do
  it "orders by  name" do
    prn=Group.where(name: "suvarna").last.id
    lindeman = Person.create!(:name => "raj",:group_id => prn)
    lindeman.group.skills.each do |i| 
		  lindeman.skills << Skill.find_by_id(i)
	end
  end
end
