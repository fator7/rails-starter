Rails.application.routes.draw do
  api_version(module: "V1", header: {
                              name: "Accept",
                              value: "application/vnd.mycompany+json;version=1",
                              defaults: {:format => :json}
                            }) do

    resources :companies

  end

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
