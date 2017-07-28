root = '/var/www/vensera/current'
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.error.log"
stdout_path "#{root}/log/unicorn.access.log"
 
listen '/var/sockets/unicorn.vensera.sock'
worker_processes 2
timeout 30