FactoryGirl.define do
	factory :race do
		name { Faker::StarWars.character }
		race_type { Faker::StarWars.character }
		final false
		competition_id nil
	end	
end