@echo off
setlocal ENABLEEXTENSIONS

REM ==============================
REM Konfiguration
REM ==============================

set FORMATTER_EXE=C:\Delphi\GExperts for RAD Studio 12\GExpertsFormatter.exe
set SOURCE_DIR=..\src

if not exist "%FORMATTER_EXE%" (
    echo FEHLER: GExperts Formatter nicht gefunden
    exit /b 1
)

echo === Code-Formatierung mit GExperts ===
echo Quelle: %SOURCE_DIR%
echo Profil: %USERPROFILE%\AppData\roaming
echo.

REM ==============================
REM Formatierung ausführen
REM ==============================

for /r "%SOURCE_DIR%" %%F in (*.pas *.dpr *.dpk) do (
    if /I not "%%~xF"==".dproj" (
        echo Formatiere: %%F
        "%FORMATTER_EXE%" "%%F"
    )
)

echo.
echo Formatierung abgeschlossen.
exit /b 0