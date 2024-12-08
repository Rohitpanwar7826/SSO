class Tenants::Organization < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :title, presence: true
  validates :follback_page_url, presence: true

  has_and_belongs_to_many :users, class_name: 'Tenants::Organization', join_table: :tenants_user_organizations
end
