$ErrorActionPreference = 'Stop'
if (Get-Service ASPNETCoreDemo -ErrorAction Ignore ) {
	Stop-Service ASPNETCoreDemo
	# Delete the service registration
	&sc.exe delete ASPNETCoreDemo
}