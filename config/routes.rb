Collect::Engine.routes.draw do

  resources :forms

  ## Routes to send forms from the Rails app to the ODK Collect mobile app
  get 'formList', to: 'odk#index', as: :odk, defaults: { format: 'xml' }
  resources :odk, defaults: { format: 'xml' }, only: [:index, :show]

  ## Route to submit forms from the ODK Collect mobile app to the Rails app.
  match '/submission', to: 'odk#submission', via: :all, defaults: { format: 'xml' }
  
end
