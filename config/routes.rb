Rails.application.routes.draw do

  root to: 'homes#top'

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :schools, controllers: {
    sessions: 'public/schools/sessions',
    passwords: 'public/schools/passwords',
    registrations: 'public/schools/registrations'
  }

  devise_for :players, controllers: {
    sessions: 'public/players/sessions',
    passwords: 'public/players/passwords',
    registrations: 'public/players/registrations'
  }

  namespace :admin do
    resources :players, only: [:index, :edit, :update]
    resources :schools, only: [:index, :edit, :update]
  end

  scope module: :public do
    
    # 退会確認画面&論理削除用のルーティング
    get 'unsubscribe_check' => 'players#unsubscribe_check', as: 'unsubscribe_check'
    patch 'players/unsubscribe' => 'players#unsubscribe', as: 'unsubscribe'
    get 'unsubscribe_confirm' => 'schools#unsubscribe_confirm', as: 'unsubscribe_confirm'
    patch 'schools/unsubscribe' => 'schools#unsubscribe', as: 'unsubscribe_school'

    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :players, only: [:show, :edit, :update] do
      post "likes" => "likes#create", as: "likes"
      delete "like" => "likes#destroy", as: "like"
    end

    resources :schools do
      get '/likes_players' => 'likes#like'
    end

    resources :rooms, only: [:create,:show, :index] do
      resources :messages, only: [:create]
    end

      get '/searches' => 'schools/searches#search'
      get '/searches/result' => 'schools/searches#result'

  end

end
