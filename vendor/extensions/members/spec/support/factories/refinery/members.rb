
FactoryGirl.define do
  factory :member, :class => Refinery::Members::Member do
    sequence(:firstname) { |n| "refinery#{n}" }
  end
end

