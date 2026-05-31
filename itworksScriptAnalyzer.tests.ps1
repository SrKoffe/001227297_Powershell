Describe "PSScriptAnalyzer Quality Tests" {

    Context "Module Availability" {
        It "Should return the module if installed" {
            $result = Get-Module -ListAvailable -Name PSScriptAnalyzer
            $result | Should Not BeNullOrEmpty
        }
    }

    Context "Function: Get-OSVersion" {
        It "Should have no errors or warnings" {
            $scriptPath = "$PSScriptRoot\OS_Information_RobertoKuffel.ps1"
            $result = Invoke-ScriptAnalyzer -Path $scriptPath | Where-Object { $_.FunctionName -eq 'Get-OSVersion' }
            $result | Should BeNullOrEmpty
        }
    }

    Context "Function: Get-RemoteServiceStatus" {
        It "Should have no errors or warnings" {
            $scriptPath = "$PSScriptRoot\OS_Information_RobertoKuffel.ps1"
            $result = Invoke-ScriptAnalyzer -Path $scriptPath | Where-Object { $_.FunctionName -eq 'Get-RemoteServiceStatus' }
            $result | Should BeNullOrEmpty
        }
    }

    Context "Function: Get-PCModel" {
        It "Should have no errors or warnings" {
            $scriptPath = "$PSScriptRoot\OS_Information_RobertoKuffel.ps1"
            $result = Invoke-ScriptAnalyzer -Path $scriptPath | Where-Object { $_.FunctionName -eq 'Get-PCModel' }
            $result | Should BeNullOrEmpty
        }
    }

    Context "Function: Get-PCName" {
        It "Should have no errors or warnings" {
            $scriptPath = "$PSScriptRoot\OS_Information_RobertoKuffel.ps1"
            $result = Invoke-ScriptAnalyzer -Path $scriptPath | Where-Object { $_.FunctionName -eq 'Get-PCName' }
            $result | Should BeNullOrEmpty
        }
    }

    Context "Function: Get-DomainName" {
        It "Should have no errors or warnings" {
            $scriptPath = "$PSScriptRoot\OS_Information_RobertoKuffel.ps1"
            $result = Invoke-ScriptAnalyzer -Path $scriptPath | Where-Object { $_.FunctionName -eq 'Get-DomainName' }
            $result | Should BeNullOrEmpty
        }
    }

    Context "Function: Get-TrustedHosts" {
        It "Should have no errors or warnings" {
            $scriptPath = "$PSScriptRoot\OS_Information_RobertoKuffel.ps1"
            $result = Invoke-ScriptAnalyzer -Path $scriptPath | Where-Object { $_.FunctionName -eq 'Get-TrustedHosts' }
            $result | Should BeNullOrEmpty
        }
    }

    Context "Function: Get-OSArch" {
        It "Should have no errors or warnings" {
            $scriptPath = "$PSScriptRoot\OS_Information_RobertoKuffel.ps1"
            $result = Invoke-ScriptAnalyzer -Path $scriptPath | Where-Object { $_.FunctionName -eq 'Get-OSArch' }
            $result | Should BeNullOrEmpty
        }
    }

    Context "Function: Get-AllInfo" {
        It "Should have no errors or warnings" {
            $scriptPath = "$PSScriptRoot\OS_Information_RobertoKuffel.ps1"
            $result = Invoke-ScriptAnalyzer -Path $scriptPath | Where-Object { $_.FunctionName -eq 'Get-AllInfo' }
            $result | Should BeNullOrEmpty
        }
    }
}