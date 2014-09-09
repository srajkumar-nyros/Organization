class CreatePeopleSkills < ActiveRecord::Migration
  def change
    create_table :people_skills do |t|
       t.integer :person_id
       t.integer :skill_id
    end
  end
end
