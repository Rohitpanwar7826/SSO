class Tenants::UserApplication < ApplicationRecord
  belongs_to :sso_user
  belongs_to :application
end
