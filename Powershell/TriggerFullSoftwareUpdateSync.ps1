$siteserver = "YourServer"
$sitecode = "XXX" #Your 3 Digit Site Code
$SUP = [wmiclass]("\\$($siteserver)\root\SMS\Site_$($sitecode):SMS_SoftwareUpdate")
$Params = $SUP.GetMethodParameters("SyncNow")
$Params.fullSync = $true
$SUP.SyncNow($Params)