Rails.application.routes.draw do
  
  
  
 namespace :admin do
   resources :items, only:[:index, :new, :create,:show, :edit, :update ]
   resources :genres, only:[:index, :create, :edit, :update]
   resources :customers, only:[:index, :show, :edit, :update]
   resources :orders, only:[:show, :update]
   resources :order_details, only:[:update]
   root to: 'homes#top'
 end
 
 scope module: :public do
   resources :items, only:[:index, :show]
   resource :customers, only:[ :edit, :update]
   delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
   resources :cart_items, only:[:index, :update, :destroy, :create]
   get 'orders/complete' => 'orders#complete'
   resources :orders, only:[:new, :create, :index, :show]
   resources :addresses, only:[:index, :edit, :create, :update, :destroy]
   get 'customers/unsubscribe' =>'customers#unsubscribe'
   patch 'customers/withdraw' => 'customers#withdraw'
   post 'orders/comfirm' => 'orders#comfirm'
   
   root to: 'homes#top'
   get 'home/about' => 'homes#about'
   get 'customers/my_page' =>'customers#show'
 end
 
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  
  
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
