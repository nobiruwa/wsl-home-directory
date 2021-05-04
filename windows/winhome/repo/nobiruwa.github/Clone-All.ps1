$UrlTemplate = "https://github.com/nobiruwa/{0}"

$OriginalPath = (Get-Location).Path
$Repos = @("dot-emacs.d.git", "east-asian-ambiguous-width.git", "gistish.git", "home-directory.git", "nobiruwa.github.io.git", "win-dot-emacs.d.git", "wsl-dot-emacs.d.git", "wsl-home-directory.git", "yasnippet-snippets.git")

ForEach ($Repo in $Repos)
{
    Try
    {
        $Url = $UrlTemplate -F $Repo

        Write-Host ("Clone {0}..." -F $Repo)

        git clone $Url $Repo
    }
    Finally
    {
        Write-Host ""
    }
}


$Repo = "nobiruwa.github.io.git"
$LocalName = "nobiruwa.github.io.master.git"
$Url = $UrlTemplate -F $Repo
Write-Host ("Clone {0}..." -F $LocalName)
git clone --branch master $Url $LocalName
Write-Host ""
