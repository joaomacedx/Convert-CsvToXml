# function to Read data from csv file and returns a list containing the read data
function Read-Data-From-CSV-File {
    param (
        [string] $filePath,
        [string] $csvDelimiter
    )
    $rows = Import-Csv -Path $filePath -Delimiter $csvDelimiter
    return $rows

}

Export-ModuleMember -Function  Read-Data-From-CSV-File
