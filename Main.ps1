Import-Module -DisableNameChecking  '.\Modules\Functions\ReadDataFromCsvFile.psm1'
Import-Module -DisableNameChecking '.\Modules\Functions\WriteDataInXmlFile.psm1'

try {
    $configParams = (Get-Content '.\config.json' | Out-String | ConvertFrom-Json)

    $inputFile = $configParams."input-files-path"
    $outputFile = $configParams."output-files-path"
    $csvDelimiter = $configParams."csv-delimiter"
    
    $data = Read-Data-From-CSV-File -filePath $inputFile -csvDelimiter $csvDelimiter
    
    Write-Data-In-XML-File -data $data -outputPath $outputFile
} catch [System.SystemException] {
    Remove-Module '.\Modules\Business\ReadDataFromCsvFile.psm1'
    Remove-Module '.\Modules\Business\WriteDataInXmlFile.psm1'
}
