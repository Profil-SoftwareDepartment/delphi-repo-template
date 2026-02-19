@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

REM Optimized repository initializer for Delphi projects
REM - reduces duplication via a single download subroutine
REM - fixes folder/filename typos, reports failures

set "BASE_URL=https://raw.githubusercontent.com/profil-SoftwareDepartment/delphi-repo-template/main"
set "README_URL=%BASE_URL%/README_TEMPLATE.md"
set "README_DOCS_URL=%BASE_URL%/docs/README.md"
set "README_TESTS_URL=%BASE_URL%/tests/README.md"
set "README_TOOLS_URL=%BASE_URL%/tools/README.md"
set "CHECKLIST_URL=%BASE_URL%/CHECKLIST.md"
set "GITIGNORE_URL=%BASE_URL%/.gitignore"
set "GITATTRIBUTES_URL=%BASE_URL%/.gitattributes"
set "GITMESSAGE_URL=%BASE_URL%/gitmessage_delphi.txt"
set "FINALBUILDER_PROJECT_URL=%BASE_URL%/finalbuilder/Project.fbp8"
set "FINALBUILDER_INI_URL=%BASE_URL%/finalbuilder/FinalBuilder.ini"
set "MANIFEST_URL=%BASE_URL%/src/manifest.xml"
set "TOOLS_URL=%BASE_URL%/tools"
set "ISSUE_URL=%BASE_URL%/.github/ISSUE_TEMPLATE"
set "WORKFLOW_URL=%BASE_URL%/.github/workflows"

set "SCRIPT_DIR=%~dp0"
set "ERROR_COUNT=0"

REM Create directory structure
echo Erstelle Verzeichnisstruktur...
for %%D in (
    src
    resources
    docs
	docs\release-notes
    tools
    tests
    finalbuilder
    .github
    .github\ISSUE_TEMPLATE
    .github\workflows
) do (
    if not exist "%SCRIPT_DIR%%%D" mkdir "%SCRIPT_DIR%%%D"
)
GOTO :FILES

REM Generic downloader: CALL :download "<url>" "<outfile>"
:download
setlocal
set "url=%~1"
set "outfile=%~2"
if exist "%outfile%" (
    endlocal & exit /b 0
)
REM Show relative path from script dir for logging clarity
set "relpath=%outfile%"
if not "%relpath:~0,%SCRIPT_DIR:~0,-1%"=="" set "relpath=!relpath:%SCRIPT_DIR%=!"
echo Lade !relpath!...
powershell -NoProfile -Command "try { Invoke-WebRequest -Uri '%url%' -OutFile '%outfile%' -ErrorAction Stop } catch { exit 1 }"
if errorlevel 1 (
    echo FEHLER: Datei konnte nicht heruntergeladen werden: !relpath!
    echo Bitte URL pruefen: %url%
    endlocal & exit /b 1
)
endlocal & exit /b 0

:FILES
REM Download files (will not overwrite existing ones)
call :download "%README_URL%" "%SCRIPT_DIR%README.md"
if errorlevel 1 set /a ERROR_COUNT+=1

call :download "%README_DOCS_URL%" "%SCRIPT_DIR%docs\README.md"
if errorlevel 1 set /a ERROR_COUNT+=1

call :download "%README_TESTS_URL%" "%SCRIPT_DIR%tests\README.md"
if errorlevel 1 set /a ERROR_COUNT+=1

call :download "%README_TOOLS_URL%" "%SCRIPT_DIR%tools\README.md"
if errorlevel 1 set /a ERROR_COUNT+=1

call :download "%CHECKLIST_URL%" "%SCRIPT_DIR%CHECKLIST.md"
if errorlevel 1 set /a ERROR_COUNT+=1

call :download "%GITIGNORE_URL%" "%SCRIPT_DIR%.gitignore"
if errorlevel 1 set /a ERROR_COUNT+=1

call :download "%GITATTRIBUTES_URL%" "%SCRIPT_DIR%.gitattributes"
if errorlevel 1 set /a ERROR_COUNT+=1

call :download "%GITMESSAGE_URL%" "%SCRIPT_DIR%gitmessage.txt"
if errorlevel 1 set /a ERROR_COUNT+=1

REM Issue templates
for %%T in (
    bug_report.md
    feature_request.md
    technical_debt.md
    config.yml
) do (
    call :download "%ISSUE_URL%/%%T" "%SCRIPT_DIR%.github\ISSUE_TEMPLATE\%%T"
    if errorlevel 1 set /a ERROR_COUNT+=1
)

REM Workflows
for %%T in (
    build.yml
) do (
    call :download "%WORKFLOW_URL%/%%T" "%SCRIPT_DIR%.github\workflows\%%T"
    if errorlevel 1 set /a ERROR_COUNT+=1
)

REM Tools
for %%T in (
    format-code.bat
	generate-release-notes.bat
	validate-repo.bat
) do (
    call :download "%TOOLS_URL%/%%T" "%SCRIPT_DIR%tools\%%T"
    if errorlevel 1 set /a ERROR_COUNT+=1
)


REM FinalBuilder files
call :download "%FINALBUILDER_PROJECT_URL%" "%SCRIPT_DIR%finalbuilder\Project.fbp8"
if errorlevel 1 set /a ERROR_COUNT+=1

call :download "%FINALBUILDER_INI_URL%" "%SCRIPT_DIR%finalbuilder\FinalBuilder.ini"
if errorlevel 1 set /a ERROR_COUNT+=1

REM manifest
call :download "%MANIFEST_URL%" "%SCRIPT_DIR%src\manifest.xml"
if errorlevel 1 set /a ERROR_COUNT+=1


REM git commit message
git config commit.template gitmessage.txt


if %ERROR_COUNT% NEQ 0 (
    echo Fertig mit %ERROR_COUNT% Fehler(n)
) else (
    echo Repository-Struktur erfolgreich erstellt und Dateien heruntergeladen
)

pause
endlocal
