FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@test.com" }
    password "testpass"
    password_confirmation "testpass"
  end

  factory :message do
  	content "Test message"
    conversation_id "1"
    subforum_id "1"
  	user
  end

  factory :category do
    name "Test Category"
  end   

  factory :forum do
    name "Forum Title"
    description "Forum description"
    category 	
  end

  factory :topic do
    title "Tets topic title"
    content "Test topic content"
    user
    forum
  end
end  