require "spec_helper"
require "rails_helper"

RSpec.describe "admin/users/show.html.erb", type: :view do
  let(:user)				 { User.create!(name: 'Sarah', email: 'user@email.com', password_digest: '456789') }
  let(:another_user) { User.create!(name: 'George', email: 'another_user@email.com', password_digest: '789456') }

	context "when user is authorized" do
		it "renders locals for user and shows it" do
			assign(:user, user)

			render "admin/users/user", user: user

			expect(rendered).to match user.name
			expect(rendered).to match user.email
		end
	end

	context "when user is not authorized" do
		it "returns not rendered view" do
			assign(:user, user)
			expect(rendered).to_not match user.name
		end
	end
end