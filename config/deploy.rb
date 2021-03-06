set :stages, %w(production staging)
set :default_stage, "production"

require 'capistrano/ext/multistage'
require 'capi/unicorn'

set :application, "deadline_camp"
set :rvm_type, :system

set :scm, :git
set :repository,  "git://github.com/ulmic/deadline_camp.git"

set :use_sudo, false
set :ssh_options, forward_agent: true
default_run_options[:pty] = true

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, roles: :app do
    run "ln -nfs #{release_path}/config/database.yml.sample #{release_path}/config/database.yml"
  end
end

namespace :backup do
  task :uploads_restore do
    run "rm -rf #{release_path}/public/uploads && ln -sf #{deploy_to}/shared/uploads #{release_path}/public/uploads"
  end
end

namespace :capi do
  desc 'invoke rake task. Example: cap capi:task_invoke TASK="db:seed"'
  task :task_invoke  do
    run "cd #{deploy_to}/current && bundle exec rake #{ENV['TASK']} RAILS_ENV=#{rails_env}"
  end
end

before 'deploy:finalize_update', 'deploy:symlink_db', 'backup:uploads_restore'
after "deploy:restart", "unicorn:stop"
after "deploy:update", "deploy:cleanup"

require 'capistrano_colors'
require 'airbrake/capistrano'
