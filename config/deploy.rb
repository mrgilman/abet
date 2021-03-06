# config valid only for current version of Capistrano
lock "3.4.0"

set :application, "outcomes"
set :repo_url, "git@github.mit.edu:daries/ABET.git"
set :log_level, :info

after :deploy, "deploy:restart"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
end
