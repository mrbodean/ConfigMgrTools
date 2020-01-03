$siteserver = "."
$sitecode = "XXX"
$now=get-date
$today= $now.year.ToString()+$now.month.ToString()+$now.day.ToString()+$now.hour.ToString()+$now.Minute.ToString()+$now.Second.ToString()+".000000"
Get-WmiObject -ComputerName $siteserver -Namespace root\sms\site_$sitecode -Query "SELECT * FROM SMS_Advertisement"|
 where {($_.expirationtime -lt $today) -and ($_.expirationtimeenabled -eq 'True')}