Congresspedia::Application.routes.draw do
  
  devise_for :users
  
  namespace :api do
    resources :comments, :only => [:create]
    resources :initiatives
    match "representative/:region_name/:district", :to => 'representatives#show'
  end
  
  namespace :comisiones do
    resources :iniciativas, :only => [:show]
    resources :congresistas, :only => [:show]
  end

   resources :iniciativas, :only => [:index, :show] do
     get 'page/:page', :action => :index, :on => :collection
     resource :vote_up, :controller => :vote_up, :only => [:create]
     resource :vote_down, :controller => :vote_down, :only => [:create]
     resources :comments, :only => [:create]
   end
   
   resources :congresistas, :only => [:index, :show] do
     resources :comentarios, :only => [:create]
   end

   resources :regiones, :only => [:show]
   resource :acerca_de, :only => [:show], :controller => :acerca_de
   resource :entiende_tu_congreso, :only => [:show], :controller => :entiende
   resource :proceso_legislativo, :only => [:show], :controller => :proceso_legislativo
   resource :como_funciona_congreso, :only => [:show], :controller => :funciona_congreso
   resource :abc_legislativo, :only => [:show], :controller => :abc_legislativo
   resource :contacto, :only => [:new, :create], :controller => :contacto
   resource :comenta, :only => [:show, :create], :controller => :comenta
   resource :iniciativa_comenta, :only => [:create], :controller => :iniciativa_comenta
   resources :temas, :only => [:show], :controller => :temas
   resources :partido_politico, :only => [:show], :controller => :partido_politico 

   match '/auth/:provider/callback' => 'authentications#create'

   match "/animal_politico", :to => 'animal_politico#index'
   match "busqueda/iniciativas", :to => "search_initiatives#create", :via => :post, :as => "search_initiatives"
   match "busqueda/iniciativas", :to => "search_initiatives#create", :via => :get, :as => "search_initiatives" 
   match "busqueda/diputados", :to => "search_representative#create", :via => :post, :as => "search_representative"
   match "busqueda/diputados", :to => "search_representative#create", :via => :get, :as => "search_representative"
   root :to => "home#show"
end
