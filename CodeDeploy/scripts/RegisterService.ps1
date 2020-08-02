$ErrorActionPreference = 'Stop'
New-Service -Name ASPNETCoreDemo -BinaryPathName "C:\AppServer\ASPNETCoreDemo.exe --service --urls=http://+:80" -DisplayName "ASP.NET Core Example" -StartupType Automatic 
# allow HTTP through the Windows firewall
netsh advfirewall firewall add rule name = "Open HTTP" dir=in action=allow protocol=TCP localport=80