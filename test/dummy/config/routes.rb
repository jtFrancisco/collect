Rails.application.routes.draw do
  mount Collect::Engine => "/collect"
end
