$collections = Get-CMCollection
$collections|Where-Object{$_.ServiceWindowsCount -ge 1}|%{
    $SW = Get-CMMaintenanceWindow -CollectionId $_.CollectionID
    [PSCustomObject]@{
                'Collection Name' = $_.Name
                'MW Name' = $SW.Name
                'ServiceWindow ID'= $SW.ServiceWindowID
                'Description' = $SW.Description
                'ServiceWindowSchedules' = $SW.ServiceWindowSchedules
                'Duration' = $SW.Duration
                'IsEnabled' = $SW.IsEnabled
                'IsGMT' = $SW.IsGMT
                'Start Time' = $SW.StartTime
                'Type' = $SW.ServiceWindowType
                'RecurrenceType' = $SW.RecurrenceType
        }#[PSCustomObject]@
}|Export-Csv -Path c:\temp\MW.csv -Append -NoTypeInformation
