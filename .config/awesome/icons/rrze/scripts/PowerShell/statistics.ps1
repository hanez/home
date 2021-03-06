Param(
    #workingDir can be set via script parameter
    [string]$workingDir = "",
    [bool]$countSvgPng = $false,
    [bool]$showDifferences = $true
    )


#Create empty arrays for all scalings
$svg16 = $svg22 = $svg32 = $svg48 = $svg72 = $svg150 = $svg720 = $svgscalable = @()
$png16 = $png22 = $png32 = $png48 = $png72 = $png150 = $png720  = @()

#Select a folder
function Select-Folder($message='Select a folder ...', $path = "$home") { 
    $object = New-Object -comObject Shell.Application  
     
    $folder = $object.BrowseForFolder(0, $message, 0, $path) 
    if ($folder -ne $null) { 
        $folder.self.Path 
    } 
} 

#Count per Scaling
function Count-Per-Scaling {
    
    Write-Host "Design: "(Get-Item $workingDir).BaseName

    $counter = 0

    #Set name for statistics table
    $tabName = “IconCount”

    #Create Table object
    $table = New-Object system.Data.DataTable “$tabName”

    #Define Columns
    $col1 = New-Object system.Data.DataColumn Scaling,([string])
    $col2 = New-Object system.Data.DataColumn FileType,([string])
    $col3 = New-Object system.Data.DataColumn Count,([int])

    #Add the Columns
    $table.columns.add($col1)
    $table.columns.add($col2)
    $table.columns.add($col3)

    #identify directories
    Get-ChildItem $workingDir | where {$_.Attributes -eq 'Directory'} | ForEach-Object {
        #Write-Host "Scaling:"
        #Write-Host $_.Fullname
    
        #Create a row for svg
        $row = $table.NewRow()
        #Enter data in the row
        $row.Scaling = “$_” 
        $row.FileType = “svg”
        
        #count all svg
        Get-ChildItem $_.Fullname -recurse -filter "*.svg"| ForEach-Object {
            $counter++
        }

        #Write-Host "$_\*.svg =" $counter

        #Enter data in the row
        $row.Count = $counter
        #Add the row to the table
        $table.Rows.Add($row)
        
        #null the counter
        $counter = 0
        
        ##Here starts COUNTING PNGs
        #Create a row for png
        $row = $table.NewRow()
        #Enter data in the row
        $row.Scaling = “$_”
        $row.FileType = “png”
        
        #Count all png
        Get-ChildItem $_.Fullname -recurse -filter "*.png"| ForEach-Object {
            $counter++
        }
        #Write-Host "$_\*.png =" $counter
        
        #Enter data in the row
        $row.Count = $counter
        #Add the row to the table
        $table.Rows.Add($row)

        #null the counter to be sure ...
        $counter = 0 
    }
    #Display the table with results
    $table | format-table -AutoSize

}


function Differences-SVG {
    Get-ChildItem $workingDir -recurse -filter "*.svg"| ForEach-Object{
        #we need the current file with it's full path 
        $file = $_.FullName
        $fileBasename = (Get-Item $file).Directory.BaseName+"\"+(Get-Item $file).Basename
        #Write-Host $file
        #Write-Host $fileBasename
    
        $svgFileDirectory = (Get-Item $file).Directory.parent.BaseName
        #Write-Host $svgFileDirectory
        
        switch ($svgFileDirectory) {
            "16x16" {
                $svg16 += $fileBasename
            }
            
            "22x22" {
                $svg22 += $fileBasename

            }
            
            #"32x32" {}
            
            #"48x48" {}
            
            #"72x72" {}
            
            #"150x150" {}
            
            #"720x720" {}
            
            "scalable" {
                $global:svgscalable += $fileBasename
            }
            
        }
        
    }
    
    #sort all array after all files have been processed
    
     $svg16 = $svg16 | sort
     $svg22 = $svg22 | sort
     $svg32 = $svg32 | sort
     $svg48 = $svg48 | sort
     $svg72 = $svg72 | sort
     $svg150 = $svg150 | sort
     $svg720 = $svg720 | sort
     $global:svgscalable = $global:svgscalable | sort
     
 
     $diff16 = Compare-Object -ReferenceObject $global:svgscalable -DifferenceObject $svg16 -PassThru
     $diff22 = Compare-Object -ReferenceObject $global:svgscalable -DifferenceObject $svg22 -PassThru
     #$diff32 = Compare-Object -ReferenceObject $svgscalable -DifferenceObject $svg32 -PassThru
     #$diff48 = Compare-Object -ReferenceObject $svgscalable -DifferenceObject $svg48 -PassThru
     #$diff72 = Compare-Object -ReferenceObject $svgscalable -DifferenceObject $svg72 -PassThru
     #$diff150 = Compare-Object -ReferenceObject $svgscalable -DifferenceObject $svg150 -PassThru
     #$diff720 = Compare-Object -ReferenceObject $svgscalable -DifferenceObject $svg720 -PassThru
     
     Write-Host $diff16.Count"/"$global:svgscalable.Count "svg missing in 16x16:"
     foreach ($element in $diff16) {Write-Host $element}
     Write-Host ""
     Write-Host $diff22.Count"/"$global:svgscalable.Count "svg missing in 22x22:"
     foreach ($element in $diff22) {Write-Host $element}
     #TODO add here more comparisons if more scalings get their own svgs
}


function Differences-PNG {
    Get-ChildItem $workingDir -recurse -filter "*.png"| ForEach-Object{
        #we need the current file with it's full path 
        $file = $_.FullName
        $fileBasename = (Get-Item $file).Directory.BaseName+"\"+(Get-Item $file).Basename
        #Write-Host $file
        #Write-Host $fileBasename
    
        $svgFileDirectory = (Get-Item $file).Directory.parent.BaseName
        #Write-Host $svgFileDirectory
        
        switch ($svgFileDirectory) {
            "16x16" {
                $png16 += $fileBasename
            }
            
            "22x22" {
                $png22 += $fileBasename

            }
            
            "32x32" {
                $png32 += $fileBasename
            }
            
            "48x48" {
                $png48 += $fileBasename
            }
            
            "72x72" {
                $png72 += $fileBasename
            }
            
            "150x150" {
                $png150 += $fileBasename
            }
            
            "720x720" {
                $png720 += $fileBasename
            }
        }
        
    }
    
    #sort all array after all files have been processed
    $png16 = $png16 | sort
    $png22 = $png22 | sort
    $png32 = $png32 | sort
    $png48 = $png48 | sort
    $png72 = $png72 | sort
    $png150 = $png150 | sort
    $png720 = $png720 | sort

    $diff16 = Compare-Object -ReferenceObject $global:svgscalable -DifferenceObject $png16 -PassThru
    $diff22 = Compare-Object -ReferenceObject $global:svgscalable -DifferenceObject $png22 -PassThru
    $diff32 = Compare-Object -ReferenceObject $global:svgscalable -DifferenceObject $png32 -PassThru
    $diff48 = Compare-Object -ReferenceObject $global:svgscalable -DifferenceObject $png48 -PassThru
    $diff72 = Compare-Object -ReferenceObject $global:svgscalable -DifferenceObject $png72 -PassThru
    $diff150 = Compare-Object -ReferenceObject $global:svgscalable -DifferenceObject $png150 -PassThru
    $diff720 = Compare-Object -ReferenceObject $global:svgscalable -DifferenceObject $png720 -PassThru
     
    Write-Host $diff16.Count"/"$global:svgscalable.Count "png missing in 16x16:"
    foreach ($element in $diff16) {Write-Host $element}
    Write-Host ""
    Write-Host $diff22.Count"/"$global:svgscalable.Count "png missing in 22x22:"
    foreach ($element in $diff22) {Write-Host $element}
    Write-Host ""
    Write-Host $diff32.Count"/"$global:svgscalable.Count "png missing in 32x32:"
    foreach ($element in $diff32) {Write-Host $element}
    Write-Host ""
    Write-Host $diff48.Count"/"$global:svgscalable.Count "png missing in 48x48:"
    foreach ($element in $diff48) {Write-Host $element}
    Write-Host ""
    Write-Host $diff72.Count"/"$global:svgscalable.Count "png missing in 72x72:"
    foreach ($element in $diff72) {Write-Host $element}
    Write-Host ""
    Write-Host $diff150.Count"/"$global:svgscalable.Count "png missing in 150x150:"
    foreach ($element in $diff150) {Write-Host $element}
    Write-Host ""
    Write-Host $diff720.Count"/"$global:svgscalable.Count "png missing in 720x720:"
    foreach ($element in $diff720) {Write-Host $element}
    
}

#select Design to process
    $workingDir = Select-Folder -mess 'Please select one Design in the RRZE Icon Set folder!' #-path "$home\Documents\GitHub\rrze-icon-set"

if ($countSvgPng) {
    Count-Per-Scaling
}

if ($showDifferences) {
Differences-SVG

Differences-PNG
}
