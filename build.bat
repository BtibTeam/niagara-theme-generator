@echo off
set /p Input=Dossier du module a compiler ? (ex: themeBtib-ux) :

:: change directory or exit
pushd "%Input%" || goto :END

:: install dev dependencies
call npm install
:: compile less files
call node -e "require('grunt').tasks('less');"
popd
:: build script
if "%1" == "--skip" goto :DONE
call %~dp0.lib/gradlew.bat build

:END
pause

:DONE
