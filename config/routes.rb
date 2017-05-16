Rails.application.routes.draw do

  get 'reg_disables/new'

  get 'reg_disables/index'

  get 'reg_disables/edit'

  get 'reg_disables/show'

  get 'sessions/new'

  get 'registrations/new'

  get 'registrations/update'

  get 'users/new'

  get 'static_pages/home'

  get 'static_pages/help'

  root 'static_pages#home'
  get 'contact' => 'static_pages#contact'
  get 'event' => 'static_pages#event'
  get 'gallery' => 'static_pages#gallery'
  get 'newstudent' => 'static_pages#newstudent'
  get 'congratulations' => 'static_pages#congratulations'
  get 'independenceday' => 'static_pages#independenceday'
  get 'independenceday1' => 'static_pages#independenceday1'
  get 'utsav' => 'static_pages#utsav'
  get 'utsav1' => 'static_pages#utsav1'
  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  resources :users
  resources :registrations
  resources :utsav_registrations
  resources :utsav_seats
  
  resources :reg_disables, except: [:destroy] do
    collection do
      delete :remove_all_students
      delete :remove_all_utsav_registrations
      delete :remove_all_utsav_seats
    end 
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
