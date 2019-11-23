Rails.application.routes.draw do
  root 'pages#accueil'
  get 'linguini' => 'creates#linguini'
  resources :colleagues
  get 'creation' => 'creates#create_cakes'
  get 'patisseries' => 'creates#index'
  patch 'linguini/selection' => 'creates#selection'
  get 'reinit' => 'creates#reinit'
  get 'coh' => 'creates#chief_of_happiness'
  patch 'coh/cselection' => 'creates#cselection'
  get 'result' => 'creates#result'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
