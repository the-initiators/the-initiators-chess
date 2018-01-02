require "test_helper"

describe User do
  let(:user_name) { User.new(id: "1", email: "test@test.com", password: "12345abcd", 
                    password_confirmation: "12345abcd", created_at: "1/1/2016", 
                    updated_at: "1/1/2016", user_name: "test", rating: "3") }

  it "must be valid" do
    value(user_name).must_be :valid?
  end
end
