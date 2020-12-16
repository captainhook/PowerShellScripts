$AdminURL="https://x-admin.sharepoint.com" #change to your tentant
Connect-SPOService -Url $AdminURL

$StorageQuota = 102400
$StorageQuotaWarningLevel = 81920

Import-CSV -Path .\Sites.csv | ForEach-Object {
	#Get Site URL from relevant column in CSV
	$SiteURL = $_.SiteURL
	
	#Set Storage Quota
	Set-SPOSite -Identity $SiteURL -StorageQuota $StorageQuota -StorageQuotaWarningLevel $StorageQuotaWarningLevel
}
