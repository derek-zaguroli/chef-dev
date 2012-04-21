git node["chef-dev"]["vim_dir"] do
  repository node["chef-dev"]["repo"]
  reference "master"
  action :sync
end

bash "cp vimrc" do
  user "root"
  cwd node["chef-dev"]["vim_dir"]
  code <<-EOH
  cp .vimrc ..
  mv `which vi` /bin.vi.bak
  cp `which vim` /bin/vi
  EOH
end
