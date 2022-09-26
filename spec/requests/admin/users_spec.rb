require 'rails_helper'

RSpec.describe "Admin::UsersController", type: :request do
  let(:admin_user) { FactoryBot.create(:admin_user) }
  let(:headers)    { { "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials(admin_user.name, admin_user.password_digest) } }
  let(:params)     { { user: { name: 'test', email: 'test@email.com', password_digest: '321123' }, format: :json } }
  let(:user)       { FactoryBot.create(:user) }

  describe "POST admin/users" do

    context "when user is authorized" do
      it "returns a success response" do
        post admin_users_path, headers: headers, params: params
        
        expect(response).to have_http_status(201)
      end
    end

    context "when user is not authorized" do
      it "returns unauthorized response" do
        post admin_users_path, params: params
        
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "GET admin/users" do
    context "when user is authorized" do
      it "returns a success response" do
        get admin_users_path, headers: headers
        
        expect(response).to have_http_status(200)
      end
    end

    context "when user is not authorized" do
      it "returns unauthorized response" do
        get admin_users_path
        
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "GET admin/users/:id" do
    it "returns show user" do
      get admin_user_path(user.id), headers: headers

      expect(response).to have_http_status(200)
    end
  end

  describe "GET admin/users/:id/edit" do
    it "returns edit user page" do
      get edit_admin_user_path(user.id), headers: headers

      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH admin/users/:id/update" do
    it "updates user" do
      patch admin_user_path(user.id), headers: headers, params: params

      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE admin/users/:id/delete" do
    it "deletes user" do
      delete admin_user_path(user.id), headers: headers

      expect(response).to have_http_status()
    end
  end

end
