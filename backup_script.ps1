# copies every directory and subdirectory on a drive X:\
# to a folder Y:\backup\ on an external backup device/hard disk 
# without copying desktop.ini or system files

$Source = "X:\"
$Dest = "Y:\backup\"
$TopDirs = Get-ChildItem -Path $Source -directory
$LogsDir = "X:\backup.log"
$Options = "/MIR /COPYALL /XA:S /XF desktop.ini /MT:16 /J /Z /LOG:'$LogsDir'"
Write-Host "Beginning backup of files and folders from $Source to $Dest" -ForegroundColor Yellow
foreach ($Dir in $TopDirs) {
	$cmd = "robocopy.exe '$Source$Dir' '$Dest$Dir' $Options"
	Write-Host $cmd
	Invoke-Expression $cmd
}
Write-Host "Done!" -ForegroundColor Green
