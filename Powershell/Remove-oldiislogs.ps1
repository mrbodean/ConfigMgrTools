$logs = Get-ChildItem -Path C:\inetpub\logs -Recurse -Filter *.log
$oldest = (get-date).AddDays(-30)
foreach($log in $logs){
    if($log.LastWriteTime -lt $oldest){
        $log.Delete()
     } 
}