module Tenant
  class ApplicationController < ::ApplicationController
    # before_action :authenticate_sso_user!


    def strong_params
      # Skipping additional settings just beacouse additional settings contains 
      # The class name and path and we don't want this here
      @attributes.except(:additional)
    end

    def permit_params
      params.require(@attributes[:additional][:klass].to_s.underscore).permit(*strong_params.keys)
    end
  end
end
