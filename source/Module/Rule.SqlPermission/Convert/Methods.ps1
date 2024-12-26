# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
#region Method Functions

<#
    .SYNOPSIS
        Retrieves the SqlDatabase name from the check-content element in the xccdf

    .PARAMETER CheckContent
        Specifies the check-content element in the xccdf
#>
function Set-LoginName
{
    [CmdletBinding()]
    [OutputType([string])]
    param
    (
        [Parameter(Mandatory = $true)]
        [string]
        $CheckContent
    )

    $loginName = 'NT AUTHORITY\SYSTEM'

    return $loginName
}

<#
    .SYNOPSIS
        Retrieves the SqlDatabase name from the check-content element in the xccdf

    .PARAMETER CheckContent
        Specifies the check-content element in the xccdf
#>
function Set-Permission
{
    [CmdletBinding()]
    [OutputType([string])]
    param
    (
        [Parameter(Mandatory = $true)]
        [string]
        $CheckContent
    )

    # This is the setting for a non FCI or AlwaysOn configuration
    # Other configurations must use an exception to meet STIG requirements
    <#$permissionSetting = "@(ServerPermission
                        {
                            State      = 'Grant'
                            Permission = @('CONNECTSQL', 'VIEWANYDATABASE')
                        }
                            ServerPermission
                        {
                            State      = 'GrantWithGrant'
                            Permission = @()
                        }
                        ServerPermission
                        {
                            State      = 'Deny'
                            Permission = @()
                        })"#>
    $permissionSetting = ('CONNECTSQL,VIEWANYDATABASE')

    return $permissionSetting
}