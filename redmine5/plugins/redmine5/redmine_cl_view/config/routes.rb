# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get  'redmine_cl_view_setting/show' => 'redmine_cl_view_setting#show'
get  'redmine_cl_view_setting/index' => 'redmine_cl_view_setting#index'
post 'redmine_cl_view_setting/create' => 'redmine_cl_view_setting#create'
post 'redmine_cl_view_setting/update' => 'redmine_cl_view_setting#update'

Rails.application.routes.draw do
  resources :projects do
    get  'clientlist'   => 'clientlist#index'
    #get  'clientlist'   => 'clientlist#update'
    post 'clientlist/update'   => 'clientlist#update'
    #get 'clientlist/update'   => 'clientlist#update'
    #get 'clientlist/list' => 'pivot#list'
  end
end
