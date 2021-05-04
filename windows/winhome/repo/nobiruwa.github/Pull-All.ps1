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
        git pull
    }
    Finally
    {
        Write-Host ("Leaving {0}..." -F $Name)
        cd $OriginalPath
        Write-Host ""
    }
}
