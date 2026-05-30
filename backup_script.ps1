$Source = "X:\"
$Dest = "Y:\backup\"
$TopDirs = Get-ChildItem -Path $Source -directory
$LogsDir = "X:\backup.log"
$Options = "/MIR /COPYALL /XA:S /XF desktop.ini /MT:16 /J /Z /LOG:'$LogsDir'"
foreach ($Dir in $TopDirs) {
	$cmd = "robocopy.exe '$Source$Dir' '$Dest$Dir' $Options"
	Invoke-Expression $cmd
}
