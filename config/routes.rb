Rails.application.routes.draw do
    get "/" => "site#home"
    get "/contact" => "site#contact"
    get "/projects" => "projects#index"
    get "/projects/:id" => "projects#show"
    get "/project/new" => "projects#new"
    post "/projects" => "projects#create"
    get "projects/:project_id/entries" => "entries#index"

end
