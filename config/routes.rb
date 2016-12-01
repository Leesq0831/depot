Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  get 'admin/index'  =>  "admin#index"

  controller  :sessions  do
    get  'login'  =>  :new
    post  'login'  =>  :create
    delete  'logout'  =>  :destroy
  end
  mount ChinaCity::Engine  =>  '/china_city'
  scope  '(:locale)'   do
  resources :orders
  resources :line_items
  resources :carts
  get  "store/index"
 root  :to  =>  "store#index",  :as  =>  'store'

  resources :products  do
    member  do
      get  'who_bought'
    end
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
