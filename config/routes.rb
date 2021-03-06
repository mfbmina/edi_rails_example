Rails.application.routes.draw do
  resources :shipments do
    patch 'update_from_xml',  to: 'shipments#update_from_xml', defaults: { format: 'xml' }
  end

  resources :products, only: [:edit, :update, :destroy]

  root 'shipments#index'
end
