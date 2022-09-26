FactoryBot.define do
	factory :user do
		name { "Natasha" }
		email { "uiomail@mail.mail" }
		password_digest { "123456" }
	end

	factory :admin_user, parent: :user do
		name { "Kolya" }
		email { "mail@mail.mail" }
		password_digest { "123123" }
	end
end