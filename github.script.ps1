# Verify this is a Git repository before running
if (-not (Test-Path .git)) {
    Write-Error "Error: This directory is not a Git repository."
    Exit
}

# Prompt user for a commit message
$commitMessage = Read-Host "Enter your commit message"

# If the user leaves it blank, use a default message
if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    $commitMessage = "Automated commit: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
}

Write-Host "`n[1/3] Staging all files..." -ForegroundColor Cyan
git add .

Write-Host "[2/3] Committing changes..." -ForegroundColor Cyan
git commit -m "$commitMessage"

Write-Host "[3/3] Pushing to GitHub..." -ForegroundColor Cyan
# Automatically detects your current active branch name
$branch = git branch --show-current
git push origin $branch

Write-Host "`n🚀 Successfully added, committed, and pushed to $branch!" -ForegroundColor Green
