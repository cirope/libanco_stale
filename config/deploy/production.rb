set :stage, :production
set :rails_env, 'production'

role :web, %w{deployer@libanco.com}
role :app, %w{deployer@libanco.com}
role :db,  %w{deployer@libanco.com}

server 'libanco.com', user: 'deployer', roles: %w{web app db}
