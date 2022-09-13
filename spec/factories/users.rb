FactoryBot.define do
	factory :user do
		name { "Kolya" }
		email { "mail@mail.mail" }
		password_digest { "123456" }
	end
end