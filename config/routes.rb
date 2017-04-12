Rails.application.routes.draw do
  get '/' => 'user#index'
  get 'user/index' => 'user#index'

  get 'comment/show/:id' => 'comment#show', as: 'photo_comments'

  get 'photo/index/:id' => 'photo#index', as: 'user_photos'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
