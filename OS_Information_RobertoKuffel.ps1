begin {
    $userChoice = 0
}

process {
    while ($userChoice -ne 9) {
        Write-Host "`n--- ITWorks OS Information Gatherer ---" -ForegroundColor Cyan
        Write-Host "1. Get Operating System"
        Write-Host "2. Get Windows Remote Service Status"
        Write-Host "3. Get Computer Manufacturer and Model"
        Write-Host "4. Get Computer Name"
        Write-Host "5. Get Computer Domain Name"
        Write-Host "6. Get Trusted Hosts"
        Write-Host "7. Get Operating System Architecture"
        Write-Host "8. Get all the above information"
        Write-Host "9. Quit"
        
        $inputStr = Read-Host "Enter a selection (1-9)"
        
        if ([int]::TryParse($inputStr, [ref]$userChoice)) {
            if ($userChoice -ge 1 -and $userChoice -le 9) {
                try {
                    switch ($userChoice) {
                        1 { Write-Host "`nThe function is working" -ForegroundColor Green }
                        2 { Write-Host "`nThe function is working" -ForegroundColor Green }
                        3 { Write-Host "`nThe function is working" -ForegroundColor Green }
                        4 { Write-Host "`nThe function is working" -ForegroundColor Green }
                        5 { Write-Host "`nThe function is working" -ForegroundColor Green }
                        6 { Write-Host "`nThe function is working" -ForegroundColor Green }
                        7 { Write-Host "`nThe function is working" -ForegroundColor Green }
                        8 { Write-Host "`nThe function is working" -ForegroundColor Green }
                        9 { Write-Host "`nExiting script. Goodbye!" -ForegroundColor Yellow }
                    }
                }
                catch {
                    Write-Host "`nAn error occurred while attempting to retrieve the information." -ForegroundColor Red
                }
            } else {
                Write-Host "`nInvalid input. Please enter a correct menu selection between 1 and 9." -ForegroundColor Red
            }
        } else {
            Write-Host "`nInvalid input. Please enter a correct menu selection between 1 and 9." -ForegroundColor Red
        }
    }
}