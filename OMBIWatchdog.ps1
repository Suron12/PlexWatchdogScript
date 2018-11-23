$HTTP_Request = [System.Net.WebRequest]::Create('http://localhost:5000')
$HTTP_Request.Timeout = 15000
$HTTP_Response = try {$HTTP_Request.GetResponse()} catch {"Webpage Timeout"}
$HTTP_Status = try {[int]$HTTP_Response.StatusCode} catch {"Webpage Timeout"}

If ($HTTP_Status -eq 200) { 
    Write-Host "Ombi is responding correctly." 
}
Else {
    write-host "Ombi is not responding! Restarting Ombi service..."; Stop-Process -processname "Ombi*"; Start-ScheduledTask "Plex Ombi"
}
