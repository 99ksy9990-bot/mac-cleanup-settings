param(
    [string]$DocumentsRoot = [Environment]::GetFolderPath("MyDocuments"),
    [string]$CodexProjectFolderName = "Codex_프로젝트"
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

$codexProjectFolders = @(
    "01_패밀리스케줄러",
    "02_광양창의융합",
    "03_포스코_신입사원_금융교육",
    "04_제주연수원_예약확인",
    "05_Mac_정리_설정",
    "06_메일발송",
    "07_비행기_예약"
)

Write-Host ""
Write-Host "Documents root: $DocumentsRoot"
Write-Host "Codex projects: $(Join-Path $DocumentsRoot $CodexProjectFolderName)"
Write-Host ""

Ensure-Folder -Path $DocumentsRoot

foreach ($folder in $documentFolders) {
    Ensure-Folder -Path (Join-Path $DocumentsRoot $folder)
}

$codexRoot = Join-Path $DocumentsRoot $CodexProjectFolderName
Ensure-Folder -Path $codexRoot

foreach ($folder in $codexProjectFolders) {
    Ensure-Folder -Path (Join-Path $codexRoot $folder)
}

Write-Host ""
Write-Host "Done. No existing files were deleted or moved."
