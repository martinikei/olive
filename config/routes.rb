Rails.application.routes.draw do

  resources :messages
  devise_for :users, controllers: { registrations: 'devise/registrations' }
  resources :profiles, only: [:edit, :update]
  resources :users


  resources :swipes do
    get 'random', on: :collection
    post 'like', on: :member
    post 'dislike', on: :member
    
    delete 'delete_my_swipes', to: 'swipes#delete_my_swipes', on: :collection, as: :delete_my_swipes
    delete 'delete_all_swipes', to: 'swipes#delete_all_swipes', on: :collection, as: :delete_all_swipes
  end

  resources :matches do
    delete 'delete_my_matches', to: 'matches#delete_my_matches', on: :collection, as: :delete_my_matches
    delete 'delete_all_matches', to: 'matches#delete_all_matches', on: :collection, as: :delete_all_matches
  end

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  get 'users' => 'devise#index'
  get 'users/:id' => 'devise#show'

  get 'photos' => 'photos#index'  

  get 'swipes' => 'swipes#index'  
  get 'matches' => 'matches#index'  

  get 'swipe' => 'swipes#swiper'  
  root "pages#index"

  mount ActionCable.server => "/cable"

end
