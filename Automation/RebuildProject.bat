@echo off

echo Administrative permissions required. Detecting permissions...
net session >nul 2>&1
if %errorLevel% == 0 (
	echo Success: Administrative permissions confirmed.
) else (
	echo Failure: Current permissions inadequate.
	pause
	exit
)

:: change the current directory to the bat location
pushd %~dp0

call UtilityBats/MakeDefaultConfigFiles.bat --noPause
call UtilityBats/LoadVars.bat
call UtilityBats/VerifyVars.bat --noPause

pushd "%cd%\.."

echo downloading submodules
git submodule init
git submodule update --remote

echo making symbolic link
rmdir "%ProjectFolder%\Content\DRGLib"
del "%ProjectFolder%\Content\DRGLib"
mklink /d "%ProjectFolder%\Content\DRGLib" "..\..\DRGLibModule\DRGLib UE project\Content\DRGLib"

pause
