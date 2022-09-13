require 'rails_helper'
require 'admin/users_controller'
require 'support/auth_helper'

RSpec.describe "Admin::UsersController", type: :request do
  include AuthHelper

  describe "GET admin/users" do
  
    it 'requires authentication' do
      get admin_users_path
      expect(response.status).to eq(401)
    end

    before(:each) do
      http_login
      get admin_users_path, headers: { Authorization: @encoded_credentials }
    end

    it 'accepts valid credentials' do
      expect(response.status).to eq(200)
    end

    # before(:each) do
    #   http_login
    # end

    it "renders all users" do
      expect(response).to have_http_status(200)
    end

    it "creates a user" do
      user = FactoryBot.create(:user)
      http_login
      post admin_users_path, headers: { Authorization: @encoded_credentials }, params: user
      expect(response).to have_http_status(201)
    end
  end


  describe "GET admin/users/:id" do
    it "show user" do
      user = FactoryBot.create(:user)
      http_login
      get admin_user_path(user.id), headers: { Authorization: @encoded_credentials }
      expect(response).to render_template(:show)
    end
  end

end
