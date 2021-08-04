Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "figurines#index"

  resources :figurines do
    resources :bookings, only: [:create]
  end
  resources :universes, except: [:show]
  resources :families, except: [:show]
  resources :specialities, except: [:show]
  resources :artists, except: [:show]
  resources :games, except: [:show]
end
