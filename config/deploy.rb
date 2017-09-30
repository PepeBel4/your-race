# run this command on ubuntu server is bundler is missing on this gemset.
# rvm 2.4.0@{{application_name}} do gem install bundler
lock '3.4.1'

set :application, 'your-race'
set :repo_url, 'git@github.com:PepeBel4/your-race.git'
set :rvm_ruby_version, '2.4.1@your-race --create'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :assets_roles, [:app]
set :migration_role, [:app]
set :keep_releases, 3
set :sidekiq_user, "localadmin"
set :sidekiq_role, [:app]
set :pty,  false

namespace :deploy do
  task :restart do
    on roles(:app), in: :sequence do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  after :publishing, :restart
  after 'deploy', 'deploy:migrate'
end