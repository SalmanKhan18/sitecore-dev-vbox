# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "Sitecore-Dev-Box"
    config.vm.hostname = "Sitecore-Dev-Box"    
    config.vm.box = "windows_2019_virtualbox.box"
	config.vm.communicator = "winrm"
    config.winrm.username = "vagrant"
    config.winrm.password = "vagrant"
	config.vm.guest = :windows
    config.windows.halt_timeout = 15

    config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
    config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", auto_correct: true
    config.vm.network "private_network", ip: "192.168.33.10", auto_correct: true

    config.vm.synced_folder "./", "/vagrant"

    config.vm.provider :virtualbox do |v, override|
        v.name = "Sitecore-Dev-Box"
    end
	
	config.vm.provision :shell, path: "./scripts/Sitecore-CMS/Get-Basic-Information.ps1"
	config.vm.provision :shell, path: "./scripts/Sitecore-CMS/Copy-Directory.ps1"
	config.vm.provision :shell, path: "./scripts/Sitecore-CMS/Register-Solr.ps1"
	config.vm.provision :shell, path: "./scripts/Sitecore-CMS/Configure-SQL.ps1"
	config.vm.provision :shell, path: "./scripts/Sitecore-CMS/Install-Sitecore.ps1"
	config.vm.provision :shell, path: "./scripts/Sitecore-Commerce/Pre-Requisites.ps1"
	config.vm.provision :shell, path: "./scripts/Sitecore-Commerce/Copy-Directory.ps1"
	config.vm.provision :shell, path: "./scripts/Sitecore-Commerce/Create-Import-Certificate.ps1"
	config.vm.provision :shell, path: "./scripts/Sitecore-Commerce/Install-Sitecore-Commerce.ps1"
end