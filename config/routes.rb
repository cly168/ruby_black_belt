Rails.application.routes.draw do
	resources :users, :ideas, :likes
	get '/main' => 'sessions#index'
	post '/login' => 'sessions#login'
	delete '/logout' => 'sessions#logout'
	get '/bright_ideas' => 'ideas#index'
	post '/likes/:id' => 'likes#create'
	get '/bright_ideas/:id' => 'ideas#show'
end
