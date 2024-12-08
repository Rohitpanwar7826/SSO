class AddDetailsColumnToPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :details, :string, array: true, default: []
  end
end
