# Download and install the ASP.NET Core Hosting Bundle
mkdir C:\DotNet
Invoke-WebRequest -UseBasicParsing -Uri 'https://download.visualstudio.microsoft.com/download/pr/9b9f4a6e-aef8-41e0-90db-bae1b0cf4e34/4ab93354cdff8991d91a9f40d022d450/dotnet-hosting-3.1.6-win.exe' -OutFile C:\DotNet\aspdotnet-3.1-installer.exe
Start-Process -Wait C:\DotNet\aspdotnet-3.1-installer.exe -ArgumentList '/install','/quiet','/norestart'

# Download and install our application
mkdir C:\AppServer
Invoke-WebRequest -UseBasicParsing -Uri 'http://s3.amazonaws.com/us-east-1.andyhoppatamazon.com/samples/ASPNETCoreDemo.zip' -OutFile C:\AppServer\ASPNETCoreDemo.zip
Expand-Archive C:\AppServer\ASPNetCoreDemo.zip C:\AppServer\

# Register and start our service
New-Service ASPNetCoreDemo -BinaryPathName "C:\AppServer\ASPNETCoreDemo.exe --service --urls http://+:80"
Start-Service ASPNetCoreDemo

# Open the firewall to allow port 80
netsh advfirewall firewall add rule name="ASPNetCoreDemo" dir=in action=allow protocol=TCP localport=80
