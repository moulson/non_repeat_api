Rails.application.routes.draw do
  post '/non_repeating', to: 'non_repeating#find'
end
