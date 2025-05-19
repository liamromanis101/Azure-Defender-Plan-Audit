$defenderResources = @{
    "VirtualMachines"    = "Microsoft.Compute/virtualMachines"
    "AppServices"        = "Microsoft.Web/sites"
    "KubernetesService"  = "Microsoft.ContainerService/managedClusters"
    "SqlServers"         = "Microsoft.Sql/servers"
    "StorageAccounts"    = "Microsoft.Storage/storageAccounts"
    "Arm"                = $null  # ARM always relevant
    "Dns"                = "Microsoft.Network/dnszones"
}

$results = @()

Get-AzSubscription | ForEach-Object {
    Set-AzContext -SubscriptionId $_.Id
    $subName = $_.Name
    Write-Host "`nChecking subscription: $subName" -ForegroundColor Cyan

    # Get all Defender plans in this subscription
    $plans = Get-AzSecurityPricing

    # Get all resource types in this subscription
    $resourceTypes = Get-AzResource | Select-Object -ExpandProperty ResourceType -Unique

    foreach ($plan in $plans) {
        $planName = $plan.Name
        $pricingTier = $plan.PricingTier

        # Check if the resource type associated with this plan exists
        $expectedType = $defenderResources[$planName]
        $isInUse = if ($expectedType -eq $null -or $resourceTypes -contains $expectedType) { "Yes" } else { "No" }

        $results += [PSCustomObject]@{
            Subscription     = $subName
            DefenderPlan     = $planName
            PricingTier      = $pricingTier
            IsServiceInUse   = $isInUse
        }
    }
}

# Export to CSV
$results | Export-Csv -Path "./DefenderPlanAudit.csv" -NoTypeInformation
Write-Host "`n✅ Output written to DefenderPlanAudit.csv" -ForegroundColor Green
