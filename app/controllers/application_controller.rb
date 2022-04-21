class ApplicationController < ActionController::Base
  before_action :authenticate_admin_user!

  private

  def after_sigh_in_path
    admin_root_path
  end
end
