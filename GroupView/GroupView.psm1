<#
.SYNOPSIS
    This script allows the user to view users in specified usergroup.

.DESCRIPTION
    The script will allow the user to view either domain or local group users after specified

.NOTES
    Author: Alex McPadden
    Disclaimer: This script is provided as-is without any warranty. The author is not responsible for any potential damages or issues caused by the use of this script. Users are advised to test the script in non-production environments before using it in a production setting.

.LINK
    GitHub: https://github.com/alexmczz/group_view

#>


function domain_groups() {
    while ($true) {
        Write-Host "Enter Group: "
        $group_name = Read-Host
        if ($group_name -eq "exit") {
            break
        } elseif ($group_name -eq "clear") {
            Clear-Host
        } elseif ($res -eq "help") {
            instructions
        } elseif ($group_name -eq "list") {
            net group /domain
        } else {
            Write-Host "********************************************************************************"
            net group $group_name /domain
            Write-Host "********************************************************************************"
        }
    }
}

function local_groups() {
    while ($true) {
        Write-Host "Enter Group: "
        $group_name = Read-Host
        if ($group_name -eq "exit") {
            break
        } elseif ($group_name -eq "clear") {
            Clear-Host
        } elseif ($res -eq "help") {
            instructions
        } elseif ($group_name -eq "list") {
            net localgroup
        } else {
            Write-Host "********************************************************************************"
            net localgroup $group_name
            Write-Host "********************************************************************************"
        }
    }
}

function instructions() {
    Write-Host "How to use this program" -ForegroundColor Red
    Write-Host "To view list of options type: 'list'" -ForegroundColor Yellow
    Write-Host "To go back a menu type: 'exit'" -ForegroundColor Yellow
    Write-Host "To quit application just type 'exit' until exited or ctr-c" -ForegroundColor Yellow
    Write-Host "If the terminal is too cluttered type: 'clear'" -ForegroundColor Yellow
    Write-Host "To view this screen again type: 'help'" -ForegroundColor Green
}

function group_view() {
    instructions
    while ($true) {
        Write-Host "Enter Group Type (Domain|Local): "
        $res = Read-Host
        if ($res -eq "Local") {
            local_groups
        } elseif ($res -eq "Domain") {
            domain_groups
        } elseif ($res -eq "clear") {
            Clear-Host
        } elseif ($res -eq "help") {
            instructions
        } elseif ($res -eq "exit") {
            Write-Host "Goodbye" -ForegroundColor Green
            break
        } else {
            Write-Host "Invalid Input" -ForegroundColor Yellow
        }
    }
}

Export-ModuleMember -Function * -Alias *
group_view
