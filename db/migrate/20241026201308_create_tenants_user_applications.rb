class CreateTenantsUserApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants_user_applications, id: :uuid do |t|
      t.references :sso_user, null: false, foreign_key: true, type: :uuid
      t.references :application, null: false, foreign_key: {to_table: :tenants_applications}, type: :uuid

      t.timestamps
    end
  end
end
