Bryanricker::Application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  
  resources :scores, except: :show
  resources :videos, except: :show
  resources :audio, except: :show, controller: 'audios', as: 'audios'
  resources :blog, controller: "posts", as: 'posts'
  
  resources :pages, except: :show
  get ':id' => "pages#show", as: 'view_page' # This needs to be last
  
  root to: 'pages#index'
end
