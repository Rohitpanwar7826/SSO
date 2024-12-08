class CreateJoinTableSsoUsersOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_join_table :sso_users, :tenants_organizations do |t|
      t.index [:sso_user_id, :tenants_organization_id], name: 'user_organization'
      # t.index [:tenants_organization_id, :sso_user_id]
    end
  end
end
