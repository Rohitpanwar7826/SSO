class Tenants::Application < ApplicationRecord
  has_many :user_applications
  has_many :sso_users, through: :user_applications
end
