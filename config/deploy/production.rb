set :stage, :production
set :rails_env, 'production'

role :web, %w{deployer@prestamos.cirope.com}
role :app, %w{deployer@prestamos.cirope.com}
role :db,  %w{deployer@prestamos.cirope.com}

server 'prestamos.cirope.com', user: 'deployer', roles: %w{web app db}
