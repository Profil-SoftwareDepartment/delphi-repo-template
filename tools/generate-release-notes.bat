@echo off
setlocal enabledelayedexpansion

REM ----------------------------------------
REM Konfiguration
REM ----------------------------------------
set OUTPUT_FILE=docs\release-notes\UNRELEASED.md
set OUTPUT_FORMAT="%%s (%%h)"

REM Letzten Tag ermitteln
for /f "delims=" %%i in ('git describe --tags --abbrev^=0 2^>nul') do set LAST_TAG=%%i

if "%LAST_TAG%"=="" (
    echo Kein vorheriger Tag gefunden. Verwende kompletten Verlauf.
    set RANGE=HEAD
) else (
    echo Letzter Tag: %LAST_TAG%
    set RANGE=%LAST_TAG%..HEAD
)

echo Erzeuge Release Notes...

echo # Release Notes > %OUTPUT_FILE%
echo. >> %OUTPUT_FILE%

REM ----------------------------------------
REM Features
REM ----------------------------------------
echo ## Features >> %OUTPUT_FILE%
git log %RANGE% --pretty=format:%OUTPUT_FORMAT% | findstr /B "feat" >> %OUTPUT_FILE%
echo. >> %OUTPUT_FILE%

REM ----------------------------------------
REM Bugfixes
REM ----------------------------------------
echo ## Bugfixes >> %OUTPUT_FILE%
git log %RANGE% --pretty=format:%OUTPUT_FORMAT% | findstr /B "fix" >> %OUTPUT_FILE%
echo. >> %OUTPUT_FILE%

REM ----------------------------------------
REM Performance
REM ----------------------------------------
echo ## Performance >> %OUTPUT_FILE%
git log %RANGE% --pretty=format:%OUTPUT_FORMAT% | findstr /B "perf" >> %OUTPUT_FILE%
echo. >> %OUTPUT_FILE%

REM ----------------------------------------
REM Build / Infrastructure
REM ----------------------------------------
echo ## Build und Infrastruktur >> %OUTPUT_FILE%
git log %RANGE% --pretty=format:%OUTPUT_FORMAT% | findstr /B "build" >> %OUTPUT_FILE%
echo. >> %OUTPUT_FILE%

echo Fertig: %OUTPUT_FILE%
endlocal
