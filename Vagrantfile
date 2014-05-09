VAGRANTFILE_API_VERSION = '2'

Vagrant.configure VAGRANTFILE_API_VERSION do |config|
  config.vm.host_name = 'libanco.com'

  config.vm.box = 'ubuntu/trusty64'
  config.vm.provision :shell, path: 'puppet/tools/install.sh'

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'Libanco trusty64'
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end
end
