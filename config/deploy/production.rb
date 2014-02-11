set :stage, :production
set :rails_env, 'production'

role :web, %w{deployer@finance.com}
role :app, %w{deployer@finance.com}
role :db,  %w{deployer@finance.com}

server 'finance.com', user: 'deployer', roles: %w{web app db}
