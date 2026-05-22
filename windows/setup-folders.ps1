param(
    [string]$DocumentsRoot = [Environment]::GetFolderPath("MyDocuments"),
    [string]$DesktopRoot = [Environment]::GetFolderPath("Desktop"),
    [string]$ProjectFolderName = "04_프로젝트"
)

$ErrorActionPreference = "Stop"

function Ensure-Folder {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
        Write-Host "Created: $Path"
    }
    else {
        Write-Host "Exists:  $Path"
    }
}

$documentFolders = @(
    "00_받은문서",
    "01_염경섭",
    "02_염초롱",
    "03_포스코새마을금고",
    "04_디자인",
    "99_기타"
)

Write-Host ""
Write-Host "Documents root: $DocumentsRoot"
Write-Host "Desktop root:   $DesktopRoot"
Write-Host ""

Ensure-Folder -Path $DocumentsRoot

foreach ($folder in $documentFolders) {
    Ensure-Folder -Path (Join-Path $DocumentsRoot $folder)
}

Ensure-Folder -Path (Join-Path $DesktopRoot $ProjectFolderName)

Write-Host ""
Write-Host "Done. No existing files were deleted or moved."
