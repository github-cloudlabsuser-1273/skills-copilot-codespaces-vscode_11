# Define variables
$storageAccountName = "mystorageaccount"
$resourceGroupName = "myResourceGroup"
$location = "West Europe"

# Login to Azure
Connect-AzAccount

# Create a resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                                       -Name $storageAccountName `
                                       -Location $location `
                                       -SkuName "Standard_LRS" `
                                       -Kind "StorageV2"

# Output the storage account endpoint
$storageAccount.PrimaryEndpoints.Blob