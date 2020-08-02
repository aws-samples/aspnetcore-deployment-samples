$runtimes = &'C:\Program Files\dotnet\dotnet.exe' --list-runtimes
$aspNetRuntimeVersionString = $runtimes | where {$_ -match "AspNetCore\.App (3\.1\.\d)"} | %{ $Matches.1 } | Select -First 1
$desiredVersion = New-Object System.Version("3.1.6")
$actualVerison = New-Object System.Version("0.0.0.0")
$installRuntime = $true
if ([System.Version]::TryParse($aspNetRuntimeVersionString, [ref]$actualVerison)) {
  $installRuntime = $actualVersion -ge $desiredVersion
}
if ($installRuntime) {
	mkdir C:\DotNet
	Invoke-WebRequest -UseBasicParsing -Uri 'https://download.visualstudio.microsoft.com/download/pr/9b9f4a6e-aef8-41e0-90db-bae1b0cf4e34/4ab93354cdff8991d91a9f40d022d450/dotnet-hosting-3.1.6-win.exe' -OutFile C:\DotNet\aspdotnet-3.1-installer.exe
    Start-Process -Wait C:\DotNet\aspdotnet-3.1-installer.exe -ArgumentList '/install','/quiet','/norestart'
} else {
	echo 'ASP.NET Core 3.1.6XX or better detected.'
}

