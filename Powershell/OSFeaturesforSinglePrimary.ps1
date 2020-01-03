# Does not include WSUS because my prefferance is to install and configure it after the ConfigMgr install

Get-Module servermanager 
Install-WindowsFeature Web-Windows-Auth 
Install-WindowsFeature Web-ISAPI-Ext 
Install-WindowsFeature Web-Metabase 
Install-WindowsFeature Web-WMI 
Install-WindowsFeature BITS 
Install-WindowsFeature RDC 
Install-WindowsFeature NET-Framework-Features 
Install-WindowsFeature Web-Asp-Net 
Install-WindowsFeature Web-Asp-Net45 
Install-WindowsFeature NET-HTTP-Activation 
Install-WindowsFeature NET-Non-HTTP-Activ