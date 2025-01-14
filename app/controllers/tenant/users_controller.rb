class Tenant::UsersController < Tenant::ApplicationController
  before_action :set_attributes

  def index
  end

  def create
  end

  def new
  end



  private
  def set_attributes
    @attributes = {
      "email": :string,
      "password": :password,
      "password_confirmation": :password,
      "additional": {
        "klass": SsoUser,
        "path": users_path
      }
    }
  end
end
