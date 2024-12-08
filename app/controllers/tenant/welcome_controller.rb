class Tenant::WelcomeController < Tenant::ApplicationController
  # before_action :authenticate_sso_user!
  layout 'admin'

  def index
  end
end
