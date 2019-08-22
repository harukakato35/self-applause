Rails.application.routes.draw do
  devise_for :users
   root 'posts#index'
   get 'posts' => 'posts#index'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get   'posts/new'  =>  'posts#new'
   post  'posts'      =>  'posts#create'
   delete  'posts/:id'  => 'posts#destroy'
end
