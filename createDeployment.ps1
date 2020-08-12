dotnet publish -c Release
if (!(Test-Path deployment)) { mkdir deployment }
pushd deployment
cp -Force -Recurse ..\CodeDeploy\* .
if (!(Test-Path app)) { mkdir app }
cp -Force -Recurse ..\bin\Release\netcoreapp3.1\publish\* app\
if (Test-Path deployment.zip) { rm deployment.zip }
Compress-Archive -DestinationPath .\deployment.zip -Path *
popd