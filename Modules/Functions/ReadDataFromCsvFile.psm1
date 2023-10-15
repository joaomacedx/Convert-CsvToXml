# function to Read data from csv file and returns a list containing the read data
function Read-DataFromCSVFile {
    param (
        [string] $filePath,
        [string] $csvDelimiter
    )
    $rows = Import-Csv -Path $filePath -Delimiter $csvDelimiter
    return $rows

}

Export-ModuleMember -Function  Read-DataFromCSVFile 
