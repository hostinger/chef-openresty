systemd_service 'nginx' do
  unit_description 'Nginx'
  unit_after 'network.target remote-fs.target nss-lookup.target'
  service_type 'forking'
  service_pid_file node['openresty']['pid']
  service_exec_start_pre "#{node['openresty']['binary']} -t"
  service_exec_start node['openresty']['binary']
  service_exec_reload '/bin/kill -s HUP $MAINPID'
  service_kill_mode 'process'
  service_kill_signal 'SIGQUIT'
  service_timeout_stop_sec 5
  service_restart 'always'
  service_restart_sec 10
  service_private_tmp true
  service_limit_nofile node['openresty']['worker_connections']
  install_wanted_by 'multi-user.target'
  notifies :restart, node['openresty']['service']['resource']
end

service 'nginx' do
  provider Chef::Provider::Service::Systemd
  supports :status => true, :restart => true, :reload => true
  if node['openresty']['service']['start_on_boot']
    action [ :enable, :start ]
  end
end
