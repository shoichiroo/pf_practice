Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  root to: "public/homes#top"
  get "about" => "public/homes#about"
  get "customers/withdraw_confirm" => "public/customers#withdraw_confirm"
  patch "customers/withdraw" => "public/customers#withdraw"

  namespace :public do
    get "searches/search"
    resources :posts do
      resources :comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    get "homes/top"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
