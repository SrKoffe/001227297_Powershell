Describe "Get-OSVersion" {
    Mock Read-Host { return '9' }
    
    Mock Get-CimInstance {
        return [PSCustomObject]@{ Caption = 'Microsoft Windows 11 Pro' }
    }

    . "$PSScriptRoot\OS_Information_RobertoKuffel.ps1"

    It "Returns OS version when validly executed" {
        $result = Get-OSVersion
        $result | Should Not BeNullOrEmpty
        $result | Should Be 'Microsoft Windows 11 Pro'
    }

    It "Calls Get-CimInstance to gather OS Data" {
        Get-OSVersion
        Assert-MockCalled Get-CimInstance -Times 1
    }

    It "Returns error string when exception occurs" {
        Mock Get-CimInstance { throw 'System Exception Failure' }
        $result = Get-OSVersion
        $result | Should Match 'Error retrieving OS version:'
    }
}

Describe "Get-AllInfo" {
   
    Mock Read-Host { return '9' }
    
    
    . "$PSScriptRoot\OS_Information_RobertoKuffel.ps1"

    Mock Get-OSVersion { return 'Windows 11' }
    Mock Get-RemoteServiceStatus { return 'Running' }
    Mock Get-PCModel { return 'Dell - XPS' }
    Mock Get-PCName { return 'PC-01' }
    Mock Get-DomainName { return 'WORKGROUP' }
    Mock Get-TrustedHosts { return 'Localhost' }
    Mock Get-OSArch { return '64-bit' }


    It "Returns formatted computer information" {
        $result = Get-AllInfo
        $result | Should Not BeNullOrEmpty
        $result | Should Match '--- All System Information ---'
        $result | Should Match 'Windows 11'
    }

    It "Calls the internal module functions successfully" {
        Get-AllInfo
        Assert-MockCalled Get-OSVersion -Times 1
        Assert-MockCalled Get-RemoteServiceStatus -Times 1
    }

    It "Returns error string on failure" {
        Mock Get-OSVersion { throw 'Compilation Failure' }
        $result = Get-AllInfo
        $result | Should Match 'Error compiling all information:'
    }
}