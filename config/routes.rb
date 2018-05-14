Rails.application.routes.draw do
 #   new GET  /new(.:format)   games#new
 # score POST /score(.:format) games#score
 get "new", to: "games#new"
 post "score", to: "games#score"
 # get "game/new"
 # get "game/score"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
