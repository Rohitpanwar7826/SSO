class Account < ApplicationRecord
  validates :subdomain, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 30 }
  validates :identifier, presence: true, length: {maximum: 50}
  validates :custom_id, presence: false, length: {maximum: 100}
  enum :status, [ :building_schema, :completed ]
  # associations
  # belongs_to :plan
  # belongs_to :admin_user

  # callbacks
  after_create :perfrom_tenant_account
  before_destroy :destroy_tenant_account


  def perfrom_tenant_account
    CreateTenantSchemaJob.perform_async(id, 'create')
  end

  def destroy_tenant_account
    CreateTenantSchemaJob.perform_async(id, 'drop')
  end
end
