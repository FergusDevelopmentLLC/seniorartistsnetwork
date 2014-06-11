Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :contacts do
    resources :contacts, :path => '', :only => [:new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :contacts, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/contacts" do
      resources :contacts, :path => '' 
      resources :settings, :only => [:edit, :update]
    end
  end
end

