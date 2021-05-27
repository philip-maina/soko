# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :merchants_portal do
    resources :products
    get 'home/show', as: :home
  end
end
