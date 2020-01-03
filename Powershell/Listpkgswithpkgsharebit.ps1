# List package with the pkg share bit enabled
$sitecode = "XXX"
$siteserver = "."
Get-WmiObject sms_package -Namespace root\sms\site_$sitecode -ComputerName $siteserver | ForEach-Object {
	if ($_.pkgflags -eq ($_.pkgflags -bor 0x80)) {
		“pkg share bit enabled on {0}” -f $_.Packageid
	}
}
