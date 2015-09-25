# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'waffle.dev'
set :repo_url, 'git@github.com:trepmal/redolent-waffle.git'



set :branch, :master

set :deploy_to, -> { "/srv/www/#{fetch(:application)}" }
set :keep_releases, 5

set :log_level, :info







namespace :deploy do

#  after :restart, :clear_cache do
#    on roles(:web), in: :groups, limit: 3, wait: 10 do
#      # Here we can do anything such as:
#      # within release_path do
#      #   execute :rake, 'cache:clear'
#      # end
#    end
#  end

end



namespace :deploy do 
  desc 'Notify Me'
  task :notify_me do 
    on roles(:app) do 
      execute :curl, "-X POST  -d '{\"message\": \"MESSAGE\", \"message_format\": \"text\", \"notify\": \"true\"}'  -H 'Content-type: application/json'  -H 'Authorization: Bearer 8IuTPBpJ4nlKyiqnAKW8MLj90xBlhTn5951zRMoO'  'https://api.hipchat.com/v2/user/kailey@10up.com/message'"
    end
  end
end
after 'deploy:publishing', 'deploy:notify_me'
