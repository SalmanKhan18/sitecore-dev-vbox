function ConsoleWrite {
    Param ([string]$Value)
    
    Write-Output `n$Value  
}

function Header {
    Param ([string]$Value)

    Write-Host "[---------------------------$Value---------------------------]" -ForegroundColor Green
}