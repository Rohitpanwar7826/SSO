class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :subdomain
      t.string :identifier
      t.string :custom_id

      t.timestamps
    end
  end
end
