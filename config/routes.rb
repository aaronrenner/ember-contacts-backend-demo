Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  mount API::Base, at: '/'
  mount GrapeSwaggerRails::Engine, at: '/documentation'
end
