Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'entries#index', as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'clearance/sessions#new'
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get "/entries" => "entries#index", as: "entries"
  post "/entries" => "entries#create"
  get "/entries/new" => "entries#new", as: "new_entry"
  get "/entries/:id/edit" => "entries#edit", as: "edit_entry"
  get "/entries/:id" => "entries#show", as: "entry"
  put "/entries/:id" => "entries#update", as: "update_entry"
  delete "/entries/:id" => "entries#destroy"


end
