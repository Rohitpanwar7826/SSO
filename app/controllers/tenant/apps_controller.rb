class Tenant::AppsController < Tenant::ApplicationController
  def index
    @apps =  Tenants::Application.all
  end
end
