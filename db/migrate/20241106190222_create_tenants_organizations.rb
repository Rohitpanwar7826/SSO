class CreateTenantsOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants_organizations, id: :uuid do |t|
      t.string :name
      t.string :title
      t.string :follback_page_url

      t.timestamps
    end
  end
end
