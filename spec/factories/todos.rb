# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo, :class => 'Todos' do
    task "MyString"
    description "MyText"
  end
end
