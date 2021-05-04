$OriginalPath = (Get-Location).Path
$Repos = (Get-ChildItem -Directory -Path *.git)

ForEach ($Repo in $Repos)
{
    $Name = $Repo.Name
    $Path = $Repo.FullName

    Try
    {
        Write-Host ("Entering {0}..." -F $Name)
        cd $Path
        git config pull.rebase false
    }
    Finally
    {
        Write-Host ("Leaving {0}..." -F $Name)
        cd $OriginalPath
        Write-Host ""
    }
}
