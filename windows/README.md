# Windows PC 폴더 정리 설정

이 폴더는 다른 Windows PC에서도 같은 문서 분류 기준을 빠르게 만들기 위한 파일입니다.

## 만드는 구조

문서 폴더 바로 아래에 다음 폴더를 만듭니다.

- `00_받은문서`
- `01_염경섭`
- `02_염초롱`
- `03_포스코새마을금고`
- `04_디자인`
- `99_기타`

바탕화면에는 프로젝트 전용 폴더를 만듭니다.

- `04_프로젝트`

## 실행 방법

1. Windows에서 PowerShell을 엽니다.
2. 이 GitHub 폴더를 내려받은 위치로 이동합니다.
3. 아래 명령을 실행합니다.

```powershell
powershell -ExecutionPolicy Bypass -File .\windows\setup-folders.ps1
```

기존 파일이나 폴더는 삭제하지 않습니다. 없는 폴더만 새로 만듭니다.

## 사용자 지정 위치

문서 폴더나 바탕화면 위치를 직접 지정하려면:

```powershell
powershell -ExecutionPolicy Bypass -File .\windows\setup-folders.ps1 `
  -DocumentsRoot "D:\문서" `
  -DesktopRoot "$env:USERPROFILE\Desktop"
```
