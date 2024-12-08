class SsoUser < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_applications
  has_many :applications, through: :user_applications
  has_and_belongs_to_many :organizations, class_name: 'SsoUser', join_table: :tenants_user_organizations
end
