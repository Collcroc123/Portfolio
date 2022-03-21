@echo off
@break off

setlocal EnableDelayedExpansion

:: 1. run without notepad++
:: put this file in the same folder where pico8.exe is. done.
:: 
:: 
:: 2. run with notepad++ and setup:
:: From Toolbar > Run > Run > 
:: 
:: to load current cart in notepad+++ use:
:: "D:\Folder\apps\pico-8\pico8usb.bat" -run $(FULL_CURRENT_PATH)
:: map keys to "Shift+Alt+C"
:: name: "Pico-8: Load Cart"
:: 
:: to run pico8.exe with pico8usb.bat from within notepad++ use:
:: "D:\Folder\apps\pico-8\pico8usb.bat"
:: map keys to "Shift+Alt+R"
:: name: "Pico-8: Boot"

set wd=%~dp0
set pico8HomePath=%wd%data\
set pico8RootPath=%pico8HomePath%carts\
set pico8DesktopPath=%pico8HomePath%documents\screenshots\
set scale=6
set size=128
set /a scaledsize=%size%*%scale%
set pico8Options=-windowed 1 -width %scaledsize% -height %scaledsize% -frameless 0 -sound 256
if "%1"=="" (
  set pico8Options=%pico8Options% -console
) else (
  set pico8Options=%pico8Options% %1 %2
)

echo %wd%
echo -home: %pico8HomePath%
echo -root_path: %pico8RootPath%
echo -desktop: %pico8DesktopPath%
echo options: %pico8Options%

cd %wd%
if not exist %pico8DesktopPath% (
  mkdir %pico8DesktopPath%
  if "!errorlevel!" EQU "0" (
    echo Portable Folder Created Successfully
    goto bootPico8usb
  ) else (
    echo Error While Creating Portable Folder
    pause
    goto end
  )
) else (
  echo Portable Folder Already Exists
  goto bootPico8usb
)
goto end

:bootPico8usb
start "" "pico8.exe" -home %pico8HomePath% -root_path %pico8RootPath% -desktop %pico8DesktopPath% %pico8Options%

:: # notes
:: - [ ] native screen res is 128x128
:: - [ ] currently using x2 zoom (256x256)

:: ### posible anamorphic options:
:: - [ ] for 4x zoom 4:3:
:: - [ ] -aspect 560 -scale 4 -width 750 -height 560
:: - [ ] for 4x zoom 16:9:
:: - [ ] -aspect 747 -scale 4 -width 960 -height 560
