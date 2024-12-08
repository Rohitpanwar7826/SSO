class CreateTenantsApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants_applications, id: :uuid do |t|
      t.string :name
      t.text :long_name
      t.text :svg

      t.timestamps
    end
  end
end
