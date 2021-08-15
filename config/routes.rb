Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :schools, controllers: {
    sessions: 'schools/sessions',
    passwords: 'schools/passwords',
    registrations: 'schools/registrations'
  }

  devise_for :players, controllers: {
    sessions: 'players/sessions',
    passwords: 'players/passwords',
    registrations: 'players/registrations'
  }

  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :players do
    resources :posts, only: [:new, :create, :index, :show, :destroy]
  end

  namespace :players do
    resources :members, only: [:show]
  end

end
