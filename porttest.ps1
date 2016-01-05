<#
    .SYNOPSIS 
      Test if a port is accessible.  
    .DESCRIPTION
      Test if a port is accessible.  Handy if telnet is not installed/available.
      Writes message to stdout.  Also returns a $LASTEXITCODE of 0 if port is accessible and
      a exit code of 1 if not accessible.  Does not distinguish why the port is not accessible.
    .PARAMETER server
      The name or ip address of the host to test
    .PARAMETER port
      The IPv4 port to be tested
    .EXAMPLE
     porttest.ps1 "server.domain.com" "443"
     
     Output results to standard out. 
#>


[CmdletBinding()]
Param(
  [Parameter(Mandatory=$True)]
   [string]$server,
   [Parameter(Mandatory=$True)]
   [ValidateRange(0,65536)] 
   [int]$port
)

try{
    new-object System.Net.Sockets.TcpClient("$server", "$port") | out-null
    write-host "Successfully connected $server on port $port" -B DarkGreen
    exit 0
    
} catch {
    write-host "Was not able to connect to $server on port $port" -Backgroundcolor Red
    exit 1
}