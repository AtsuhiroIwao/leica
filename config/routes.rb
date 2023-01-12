Rails.application.routes.draw do

root to:'homes#top'

  namespace :admin do
    resources :users, only:[:index]
  end
  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end

  namespace :public do
    resources :users, only:[:show,:edit,:update,:destroy]do
      member do
    get :likes
    end
      get :search, on: :collection
      resource :relationships, only: [:create, :destroy]
        get :followings, on: :member
        get :followers, on: :member
end
end

  namespace :public do
    resources :posts, only:[:index,:new,:create,:destroy, :show]do
      resource :likes, only: [:create, :destroy]
        resources :comments, only:[:create,:destroy]
          collection do
            get 'search'
          end
    end
  end

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
