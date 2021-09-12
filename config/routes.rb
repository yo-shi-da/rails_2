Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/show'
  get 'users/new'
  get 'pictures/index'
  get 'pictures/show'
  get 'pictures/new'
  get 'pictures/edit'
  get 'pictures/comfirm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
