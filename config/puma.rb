workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count
app_path = File.expand_path(File.dirname(File.dirname(__FILE__)))


preload_app!

rackup      DefaultRackup
#port        ENV['PORT']     || 3000
#environment ENV['RACK_ENV'] || 'development'

daemonize false
rails_env = ENV['RACK_ENV'] || 'production'

rackup      DefaultRackup
#port        ENV['PORT']     ||   "unix://#{app_path}/tmp/puma/sock"
# until further notice port is used over socket 
# bind "unix://#{app_path}/tmp/puma/sock"
bind 'tcp://0.0.0.0:9292'

environment rails_env

# puma pid kept on file
pidfile    "#{app_path}/tmp/puma/pid"
# puma stdout and stderror directed to log files 
stdout_redirect      "#{app_path}/log/puma_access.log", "#{app_path}/log/puma_error.log"




on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/
  # deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end
