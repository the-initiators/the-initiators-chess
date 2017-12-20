class ActiveSupport::TestCase
	include FactoryBot::Syntax::Methods



FactoryBot.define do
	factory :piece do
	end

	factory :bishop do 
	end

	factory :king do 
	end

	factory :knight do 
	end

	factory :pawn do 
		x_position: 1,
  		y_position: 2,
  		color: "white"
	end

	factory :queen do 
	end

	factory :rook do
		x_position: 1,
  		y_position: 1,
  		color: "white"
	end
end
end