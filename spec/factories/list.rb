FactoryGirl.define do
  factory :list do
    name 'my list'

    factory :list_with_user do
      user
    end
  end
end
