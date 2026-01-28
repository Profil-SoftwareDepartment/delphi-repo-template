@echo off
setlocal ENABLEEXTENSIONS

echo === Repository Validation ===

set ERROR=0

REM --- Pflichtdateien ---
call :check_file README.md
call :check_file src\manifest.xml
call :check_file .gitignore
call :check_file .gitattributes

REM --- Pflichtordner ---
call :check_dir src
call :check_dir docs
call :check_dir tools
call :check_dir tests
call :check_dir .github\ISSUE_TEMPLATE
call :check_dir finalbuilder

REM --- Unerwuenschte Dateien ---
for /r %%F in (*.dcu *.exe *.dll) do (
    echo FEHLER: Unerwuenschte Datei gefunden: %%F
    set ERROR=1
)

REM --- Git-Status pruefen ---
for /f %%S in ('git status --porcelain') do (
    echo WARNUNG: Working Tree nicht sauber: %%S
)

if %ERROR% NEQ 0 (
    echo.
    echo VALIDATION FEHLGESCHLAGEN
    exit /b 1
)

echo.
echo Repository ist gueltig.
exit /b 0

REM ============================
REM Subroutinen
REM ============================

:check_file
if not exist "%~1" (
    echo FEHLER: Datei fehlt: %~1
    set ERROR=1
)
exit /b

:check_dir
if not exist "%~1" (
    echo FEHLER: Ordner fehlt: %~1
    set ERROR=1
)
exit /b
