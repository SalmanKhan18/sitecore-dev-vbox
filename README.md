# Sitecore Development Virtual Box

_Lets you set up the Virtual Box with Sitecore Version 9.0.2 CMS_

# Pre Requisite To Setup Sitecore VBox

1. Virtual Box <br>
	You can download the Virtual Box from [here](https://www.virtualbox.org/wiki/Downloads).

2. Packer <br>
	You can download Packer from [here](https://www.packer.io/downloads.html). 

3. Vagrant <br>
	You can download Vagrant from [here](https://www.vagrantup.com/downloads.html).

# Stack Description

_What is Sitecore ?_

Sitecore is a software which gives the power to personalize and digitally market the product seemslessly. Built on top of ASP.NET, it gives out of the box tools which help *Market*, *Manage the content*, *address the Customers* needs accordingly & give outstanding *User Experience*. <br>
More about Sitecore [here](https://www.sitecore.com/)

##

_What is Virtual Box ?_

Virtual Box is a software which can run any kind of Operating System. This gives the User the taste of both the Worlds. <br>
More about Virtual Box [here](https://www.virtualbox.org/)

##

_What is Packer ?_

Packer is a tool which lets you build your vagrant box from scratch with all the needed pre-requisite and configure the system the way you want based on your needs. <br>
More about Packer [here]()

##

_What is Vagrant ?_

Vagrant is a tool that automates the Workflow inorder to setup the Virtual Machine. <br>
More about Vagrant [here](https://www.vagrantup.com/intro/index.html)


# Setup

_IMPORTANT!_
* Download the SitecoreInstallationFiles.7z file from [here](https://drive.google.com/file/d/1WA4CkkMT7pFH4PwZH6U66OQTJMgsgIdO/view?usp=sharing).
* You should be having Sitecore License (license.xml).

```
git clone https://github.com/SalmanKhan18/sitecore-dev-vbox.git
// Unzip the SitecoreInstallationFiles.7z file and move the SitecoreInstallationFiles folder into /sitecore-dev-vbox.
// Copy & Paste your Sitecore License (license.xml) file into the SitecoreInstallationFiles/sc9_install folder.
cd sitecore-dev-vbox
packer build .\Windows-2019-Packer.json
// Wait till the process gets completed - Will take an hour approximately
vagrant up
```

Sql Server Authentication  
```
Username: sa 
Password: Qwerty@12345
```
Please change it as per the needs.

# Testing
After the installation of Sitecore gets completed, goto _C:\Windows\System32\drivers\etc_ from your Host Machine and add _*192.168.33.10 sc902.local*_ at the end of the file.
Browse http://sc902.local/sitecore and you should be able to see the website up and running! 

# License

[MIT License](https://github.com/SalmanKhan18/sitecore-dev-vbox/blob/master/LICENSE)
