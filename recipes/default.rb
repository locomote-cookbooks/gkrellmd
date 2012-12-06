package_name = if platform? %w{centos redhat}
  'gkrellm-daemon'
elsif platform? %{ubuntu debian}
  'gkrellmd'
end

package package_name do
  action :install
end

template "/etc/gkrellmd.conf" do
  source 'gkrellmd.conf.erb'
  user   'gkrellmd'
  group  'gkrellmd'

  variables(
    :port          => node['gkrellmd']['port'],
    :allowed_hosts => node['gkrellmd']['allowed_hosts']
  )
end

service 'gkrellmd' do
  action :restart
end
