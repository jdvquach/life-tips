Rails.application.routes.draw do

root :to=>"posts#show"
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


#resources :users, except: [ :index ]  # don't create the index action or template
resources :users # don't create the index action or template

# Session routes for login/logut
get    "/login" => "session#new"     # login form
post   "/login" => "session#create"  # form submits here to perform login and set session
delete "/login" => "session#destroy" # logout (delete session)

resources :posts
resources :comments

end
