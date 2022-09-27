require "spec_helper"
require "rails_helper"

RSpec.describe "admin/users/index.html.erb", type: :view do
  let(:user)				 { User.create!(name: 'Sarah', email: 'user@email.com', password_digest: '456789') }
  let(:another_user) { User.create!(name: 'George', email: 'another_user@email.com', password_digest: '789456') }

	context "when user is authorized" do
		it "returns all users" do
	    assign(:users, [ user, another_user ])

			render

			expect(rendered).to match /Sarah/
			expect(rendered).to match /George/
		end

		it "contain button create user" do
			assign(:users, [ user, another_user ])

			render

			expect(rendered).to have_css("a", text: "Create new user")
		end

		it "contain buttons to show user" do
			assign(:users, [ user, another_user ])

			render

			expect(rendered).to have_css("a", text: "Show user")
		end
	end

	context "when user is not authorized" do
		it "returns not rendered view" do
			assign(:users, [ user, another_user ])

			expect(rendered).to_not match /Sarah/
			expect(rendered).to_not match /George/
		end
	end
end