Rails.application.routes.draw do
  
  root  'public/homes#top'
  
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  namespace :admin do
     resources :items, only: [:new, :create, :index, :show, :edit, :update]
     resources :makers, only: [:new, :create, :index, :show, :edit, :update]
     resources :genres, only: [:new, :create, :index, :edit, :update]
     resources :customers, only: [:index, :show, :edit, :update]
  end
  
  namespace :public do
     resources :items, only: [:index, :show]
     resources :makers, only: [:index, :show]
     resources :contacts, only: [:new, :create]
     post 'contacts/confirm' => 'contacts#confirm', as: 'confirm'
     post 'contacts/back' => 'contacts#back', as: 'back'
     get  'done' => 'contacts#done', as: 'done'
  end   
      

  
  
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
