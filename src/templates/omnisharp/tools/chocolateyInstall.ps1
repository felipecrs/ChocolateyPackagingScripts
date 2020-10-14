$ToolsPath = Split-Path $MyInvocation.MyCommand.Definition

$PackageArgs = @{
	PackageName = "omnisharp"
	FileFullPath = Get-Item $ToolsPath\*-win-x86*.zip
	FileFullPath64 = Get-Item $ToolsPath\*-win-x64*.zip
	Destination = $ToolsPath
}
Get-ChildItem $ToolsPath\* | Where-Object { $_.PSISContainer } | Remove-Item -Recurse -Force #remove older package dirs
New-Item -Type Directory $ToolsPath\MSBuild\ -EA 0
New-Item -ItemType file $ToolsPath\MSBuild\MSBuild.exe.ignore -EA 0
New-Item -Type Directory $ToolsPath\MSBuild\Roslyn\ -EA 0
New-Item -ItemType file $ToolsPath\MSBuild\Roslyn\csc.exe.ignore -EA 0
New-Item -ItemType file $ToolsPath\MSBuild\Roslyn\csi.exe.ignore -EA 0
New-Item -Type Directory $ToolsPath\refs\ -EA 0
New-Item -ItemType file $ToolsPath\refs\OmniSharp.exe.ignore -EA 0
New-Item -Type Directory $ToolsPath\.msbuild\ -EA 0
New-Item -Type Directory $ToolsPath\.msbuild\Current\ -EA 0
New-Item -Type Directory $ToolsPath\.msbuild\Current\Bin\ -EA 0
New-Item -Type Directory $ToolsPath\.msbuild\Current\Bin\Roslyn\ -EA 0
New-Item -ItemType file $ToolsPath\.msbuild\Current\Bin\Roslyn\csc.exe.ignore -EA 0
New-Item -ItemType file $ToolsPath\.msbuild\Current\Bin\Roslyn\csi.exe.ignore -EA 0
Get-ChocolateyUnzip @PackageArgs
Remove-Item $ToolsPath\*.zip -ea 0