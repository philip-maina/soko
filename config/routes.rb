# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :merchants_portal do
    resources :products
    get 'home/show', as: :home
  end



  ####
  # Custom/Vanity routes start here
  # --------------------------------
  # For each new custom route: 
    # • Be sure you have the canonical route declared above
    # • Add the new custom route below the existing ones
    # • Document why it's needed
  # • Explain anything else non-standard
end
