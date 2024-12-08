class CreateTenantSchemaJob
  include Sidekiq::Worker

  queue_as :default

  def perform(ac_id, action)
    account = Account.find_by_id ac_id
    return if account.nil?
    
    perform_for_action(account, action)
  end

  def perform_for_action(ac, type)
    case type
    when 'create'
      create_tenant_schema(ac)
    when 'drop'
      drop_database_schema(ac)
    end
  end
  
  def drop_database_schema(ac)
    Apartment::Tenant.drop(ac.subdomain)
  end

  def create_tenant_schema(ac)
    Apartment::Tenant.create(ac.subdomain)
    ac.completed!
  end
end
