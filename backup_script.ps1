# It took me a bit of googling to figure out how to do this
# basically it copies every directory and subdirectory on a drive X:\
# to a folder Y:\backup\ within an external backup device/hard disk 
# without copying desktop.ini or system files
# obviously replace the drive letters with the ones you need

$Source = "X:\"
$Dest = "Y:\backup\"
$TopDirs = Get-ChildItem -Path $Source -directory
$LogsDir = "X:\backup.log"
$Options = "/MIR /COPYALL /XA:S /XF desktop.ini /MT:16 /J /Z /LOG:'$LogsDir'"
foreach ($Dir in $TopDirs) {
	$cmd = "robocopy.exe '$Source$Dir' '$Dest$Dir' $Options"
	Invoke-Expression $cmd
}
