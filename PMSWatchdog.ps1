$HTTP_Request = [System.Net.WebRequest]::Create('http://localhost:32400/web/index.html')
$HTTP_Request.Timeout = 15000
$HTTP_Response = try {$HTTP_Request.GetResponse()} catch {"Webpage Timeout"}
$HTTP_Status = try {[int]$HTTP_Response.StatusCode} catch {"Webpage Timeout"}

If ($HTTP_Status -eq 200) { 
    Write-Host "Plex is responding correctly" 
}
Else {
    write-host "Plex is not responding! Restarting plex service..."; 
    Stop-Process -processname "Plex*"; Start-ScheduledTask "Plex Media Server"; Start-Sleep -Seconds 5
}
