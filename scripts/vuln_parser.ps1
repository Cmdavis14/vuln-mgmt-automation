param (
    [string]$InputFile,
    [string]$OutputFile
)

Write-Host "Importing scan data..."
$data = Import-Csv $InputFile

Write-Host "Filtering high and critical vulnerabilities..."

$filtered = $data | Where-Object {
    [double]$_.CVSS -ge 7.0
} | Select-Object *, @{
    Name="Priority";
    Expression={
        if ([double]$_.CVSS -ge 9.0) {"Critical"}
        elseif ([double]$_.CVSS -ge 7.0) {"High"}
        else {"Other"}
    }
}

Write-Host "Sorting by CVSS score..."
$sorted = $filtered | Sort-Object {[double]$_.CVSS} -Descending

Write-Host "Exporting prioritized report..."
$sorted | Export-Csv -Path $OutputFile -NoTypeInformation

Write-Host "Done. Report saved to $OutputFile"
