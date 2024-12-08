require 'sidekiq/web'

class RootRouter
  def initialize
    @root = "sso"
  end

  def matches?(request)
    request.subdomain == @root
  end
end

class TenantRouter
  def initialize
    @domains = Account.pluck(:subdomain)
  end

  def matches?(request)
    @domains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  constraints RootRouter.new do
    scope module: 'sso' do
      mount Sidekiq::Web, at: '/sidekiq'
      get '/', to: 'welcome#index'
    end
  end

  constraints TenantRouter.new do
    devise_for :sso_users, controllers: {
      sessions: 'sso_users/sessions'
    }
    scope module: 'tenant' do
      get '/', to: 'welcome#index'
      resources :organizations
      get '/application', to: "apps#index"
    end
  end
end

