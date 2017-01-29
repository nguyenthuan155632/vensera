namespace :deploy do
  desc "Restart Nginx server."
  task :restart do
    on roles(:app) do
      execute "sudo /etc/init.d/nginx restart"
    end
  end

	after :deploy, "deploy:restart"
end