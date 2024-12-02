Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "/about", to: "pages#about"
  get "/about_me", to: "pages#about_me"

  get "/my_car" , to: "cars#my_car"
  get "/my_car_modle" , to: "cars#car_modle"
  get "/the_color" , to: "cars#car_color"
  get "/race_car"  ,to: "cars#car_kinde"
  get "/suv_car"  ,to: "cars#suv"
  get "/coop"  ,to: "cars#coop_car"
  get "/edit" ,to: "pages#edit_each"
  get "/info" ,to: "pages#info_page"
  get "/sign_in" ,to: "pages#sign_in"

  devise_for :users

  resources :users
  resources :books

end
