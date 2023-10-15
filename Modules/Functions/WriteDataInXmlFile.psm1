# function to write extracted data in XML file
function Write-DataInXMLFile {
    param (
        [System.Object[]] $data,
        [string] $outputPath
    )

    $xmlDoc = New-Object System.Xml.XmlDocument
    $xmlDeclaration = $xmlDoc.CreateXmlDeclaration("1.0", "UTF-8", $null)
    $xmlDoc.AppendChild($xmlDeclaration) | Out-Null
    $xmlRoot = $xmlDoc.CreateElement("rows")
    $xmlDoc.AppendChild($xmlRoot) | Out-Null

    foreach ($row in $data) {
        $xmlRow = $xmlDoc.CreateElement("row")

        $props = Get-Member -InputObject $row -MemberType NoteProperty
        foreach ($prop in $props) {
            $propValue = $row.$($prop.Name)
            $propName = $prop.Name.ToLower()

            $xmlValue = $xmlDoc.CreateElement($propName)
            $xmlValue.InnerText = $propValue
            $xmlRow.AppendChild($xmlValue) | Out-Null
        }

        $xmlRoot.AppendChild($xmlRow) | Out-Null
    }

    $xmlDoc.Save($outputPath)
}

Export-ModuleMember -Function  Write-DataInXMLFile
