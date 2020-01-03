#Original version from http://powershellsccm2012.blogspot.com/2015/06/powershellsccm2012how-to-enable-binary.html

Function enable-DeltaReplication($SiteServer,$SiteCode,$Namespace,$pkgId)
{
	$USE_BINARY_DELTA_REP = "0x04000000" #Property of SMS_PackageBaseclass for Delta replication. Refer: https://msdn.microsoft.com/en-us/library/cc146062.aspx
	$myPackage = Get-WmiObject -Namespace $Namespace -ComputerName $SiteServer -Query "SELECT * FROM SMS_PackageBaseclass Where PackageID = '${pkgId}'"
	$myPackage
	if($myPackage.PkgFlags -band $USE_BINARY_DELTA_REP) {Write-output "Already Set"} Else {
		$res=$myPackage.PkgFlags -bor $USE_BINARY_DELTA_REP
		$myPackage.PkgFlags=$res
		$myPackage.Put()
	}
	$myPackage = Get-WmiObject -Namespace $Namespace -ComputerName $SiteServer -Query "SELECT * FROM SMS_PackageBaseclass Where PackageID = '${pkgId}'"
	if($myPackage.PkgFlags -band $USE_BINARY_DELTA_REP) {return $true} Else {return $false}
}