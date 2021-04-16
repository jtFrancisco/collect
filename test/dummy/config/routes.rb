Rails.application.routes.draw do
  mount Collect::Engine => "/collect"
  root to: 'dashboards#index'
end
