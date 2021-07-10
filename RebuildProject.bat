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

rem change the current directory to the bat location
pushd %~dp0

echo downloading submodule
git submodule update --init

echo making symbolic link
rmdir "%cd%\SpacerigDecorator UE project\Content\DRGLib"
del "%cd%\SpacerigDecorator UE project\Content\DRGLib"
mklink /d "%cd%\SpacerigDecorator UE project\Content\DRGLib" "%cd%\DRGLibModule\DRGLib UE project\Content\DRGLib"

pause
