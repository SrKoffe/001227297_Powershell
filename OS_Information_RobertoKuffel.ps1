begin {
    $userChoice = 0

    function Get-OSVersion {
        try {
            $os = Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction Stop
            return $os.Caption
        }
        catch {
            return "Error retrieving OS version: $_"
        }
    }

    function Get-RemoteServiceStatus {
        try {
            $winrm = Get-Service -Name WinRM -ErrorAction Stop
            return $winrm.Status
        }
        catch {
            return "Error retrieving WinRM status: $_"
        }
    }

    function Get-PCModel {
        try {
            $pc = Get-CimInstance -ClassName Win32_ComputerSystem -ErrorAction Stop
            return "$($pc.Manufacturer) - $($pc.Model)"
        }
        catch {
            return "Error retrieving PC Manufacturer and Model: $_"
        }
    }

    function Get-PCName {
        try {
            return $env:COMPUTERNAME
        }
        catch {
            return "Error retrieving Computer Name: $_"
        }
    }

    function Get-DomainName {
        try {
            $pc = Get-CimInstance -ClassName Win32_ComputerSystem -ErrorAction Stop
            return $pc.Domain
        }
        catch {
            return "Error retrieving Domain Name: $_"
        }
    }

    function Get-TrustedHosts {
        try {
            $trustedHosts = Get-Item -Path WSMan:\localhost\Client\TrustedHosts -ErrorAction Stop
            if ([string]::IsNullOrWhiteSpace($trustedHosts.Value)) {
                return "No Trusted Hosts Configured"
            }
            return $trustedHosts.Value
        }
        catch {
            return "Error retrieving Trusted Hosts: $_"
        }
    }

    function Get-OSArch {
        try {
            $os = Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction Stop
            return $os.OSArchitecture
        }
        catch {
            return "Error retrieving OS Architecture: $_"
        }
    }

    function Get-AllInfo {
        try {
            $results = [ordered]@{
                "Operating System"      = Get-OSVersion
                "WinRM Service Status"  = Get-RemoteServiceStatus
                "Manufacturer & Model"  = Get-PCModel
                "Computer Name"         = Get-PCName
                "Domain Name"           = Get-DomainName
                "Trusted Hosts"         = Get-TrustedHosts
                "OS Architecture"       = Get-OSArch
            }
            
            $output = "`n--- All System Information ---`n"
            foreach ($key in $results.Keys) {
                $output += "$key : $($results[$key])`n"
            }
            return $output
        }
        catch {
            return "Error compiling all information: $_"
        }
    }
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
                        1 { Write-Host "`nResult: $(Get-OSVersion)" -ForegroundColor Green }
                        2 { Write-Host "`nResult: $(Get-RemoteServiceStatus)" -ForegroundColor Green }
                        3 { Write-Host "`nResult: $(Get-PCModel)" -ForegroundColor Green }
                        4 { Write-Host "`nResult: $(Get-PCName)" -ForegroundColor Green }
                        5 { Write-Host "`nResult: $(Get-DomainName)" -ForegroundColor Green }
                        6 { Write-Host "`nResult: $(Get-TrustedHosts)" -ForegroundColor Green }
                        7 { Write-Host "`nResult: $(Get-OSArch)" -ForegroundColor Green }
                        8 { Write-Host $(Get-AllInfo) -ForegroundColor Green }
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