class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans, id: :uuid do |t|
      t.string :title
      t.integer :price
      t.integer :no_users

      t.timestamps
    end
  end
end
