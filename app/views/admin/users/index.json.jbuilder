#json.array! @users, partial: "admin/users/user", locals: {user: user}, as: :user
json.array! @users do |user|
  json.html render partial: 'user', locals: { user: user }
end