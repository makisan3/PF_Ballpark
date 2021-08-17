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

  # 退会確認画面&論理削除用のルーティング
  get '/players/members/:id/unsubscribe_check' => 'players/members#unsubscribe_check', as: 'unsubscribe_check'
  patch '/players/members/:id/unsubscribe' => 'players/members#unsubscribe', as: 'unsubscribe'
  
  get '/schools/teams/:id/unsubscribe_confirm' => 'schools/teams#unsubscribe_confirm', as: 'unsubscribe_confirm'
  patch '/schools/teams/:id/unsubscribe' => 'schools/teams#unsubscribe', as: 'unsubscribe_school'


  scope module: :players do
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end

  namespace :players do
    resources :members, only: [:show, :edit, :update]
  end

  namespace :schools do
    resources :teams, only: [:show, :edit, :update]
  end

end
