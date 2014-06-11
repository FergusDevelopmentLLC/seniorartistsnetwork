
FactoryGirl.define do
  factory :event, :class => Refinery::Events::Event do
    sequence(:artist_name) { |n| "refinery#{n}" }
  end
end

