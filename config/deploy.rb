require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'  

set :domain, 'fergieshairdryer.com'
set :deploy_to, '/var/www/fergieshairdryer.com/html'
set :repository, 'https://github.com/bgribbin/ferg3.git'
set :branch, 'master'

task :environment do
  invoke :'rbenv:load'
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'bundle:install'
    queue "#{bundle_prefix} jekyll build"
  end
end
