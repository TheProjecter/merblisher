
# credentials
set :application, "akasha-labs"
set :user, "sergiu"
set :repository,  "http://merblisher.googlecode.com/svn/trunk/"
set :deploy_to, "/var/www/apps/#{application}"

# update only the modified files via remote cache
set :deploy_via, :remote_cache

# for http pulls from subversion server
set :runner, user

# roles
set :domain, "www.akasha-labs.ro"
role :app, domain
role :web, domain
role :db,  domain, :primary => true

# mongrel and rails configuration
set :rails_env, 'production'

namespace :rorails do

  desc "restart nginx if nginx.conf was changed"
  task :restart_nginx do
    sudo "/etc/init.d/nginx restart"
  end

  desc "restart merb with 3 mongrels in production mode"
  task :restart_merb do
    invoke_command "sh -c 'cd #{current_path} && merb -k all && merb -c 3 -e production'"
  end

end

namespace :deploy do

  # for whatever reason, this cannot find the mongrel pids
  # so we'll restart through a custom task
  task :restart do
    # do nothing
  end

end

# after Capistrano magic restart merb
after "deploy:restart", "rorails:restart_merb"
after "rorails:restart_merb", "deploy:cleanup"