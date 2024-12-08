class Tenant::OrganizationsController < Tenant::ApplicationController
  before_action :set_attributes

  def index
    @orgs = Tenants::Organization.all.order(created_at: :desc)
  end

  def create
    @org = Tenants::Organization.new(permite_org_params)

    unless @org.save
      render :index
    end
  end

  def set_attributes
    @create_org_hash = {
      "name": :string,
      "title": :string,
      "follback_page_url": :text,
      "additional": {
        "klass": Tenants::Organization,
        "path": organizations_path
      }
    }
  end


  private
  def permite_org_params
    params.require(:tenants_organization).permit(*@create_org_hash.except(:additional).keys)
  end
end
