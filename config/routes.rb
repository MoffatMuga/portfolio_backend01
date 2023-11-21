Rails.application.routes.draw do
  post '/contact', to: 'contacts#create'

end
