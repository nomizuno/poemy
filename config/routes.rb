Rails.application.routes.draw do

	
  get 'users/show'

  get 'posts/index'

  get '' =>"home#top"
  get "about"=>"home#about"
  get 'posts/index' => "posts#index"
  get 'posts/recent' => "posts#recent"
  get 'posts/popular' => "posts#popular"
  
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
 # post "posts/:id/update" => "posts#update"
 # post "posts/:id/destroy" => "posts#destroy"

  
  get "users/signup" => "users#new"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  get "users/:id" => "users#show"


  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  post "comments/:id/create" => "comments#create"
  post "comments/:id/destroy" => "comments#destroy"
  
  post "likes/:comment_id/create" => "likes#create"
  post "likes/:comment_id/destroy" => "likes#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
