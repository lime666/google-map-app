require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user)       { FactoryBot.create(:user) }

	context "user exists and valid only with params" do
		it "is valid with valid attributes" do
    	expect(user).to be_valid
  	end

  	it "is not valid without a name" do
  		user = User.new(name: nil)
  		expect(user).to_not be_valid
  	end

  	it "is not valid without an email" do
  		user = User.new(email: nil)
  		expect(user).to_not be_valid
  	end

  	it "is not valid if email is not unique" do
  		another_user = User.new(email: user.email)
  		expect(another_user).to_not be_valid
  	end
	end
end