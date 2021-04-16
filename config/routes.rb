Collect::Engine.routes.draw do

  resources :forms

  # Route to download forms from the Rails app into the ODK Collect mobile app
  resources :odk, defaults: { format: 'xml' }, only: [:index, :show]

  # Route to submit forms from the ODK Collect mobile app to the Rails app.
  match '/submission', to: 'odk#submissions', via: :all, defaults: { format: 'xml' }
  
end
