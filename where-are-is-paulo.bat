@echo off
cls
echo.
echo Where Are Is Paulo
echo ------------------

echo 1) Bedroom
echo 2) Kitchen
echo 3) Park
echo 4) Library
echo 5) Garage
set /a hidden=(%random% %% 5) + 1
if %hidden%==1 set "room=Bedroom"
if %hidden%==2 set "room=Kitchen"
if %hidden%==3 set "room=Park"
if %hidden%==4 set "room=Library"
if %hidden%==5 set "room=Garage"

set /p "guess=Pick a room number: "
if "%guess%"=="%hidden%" (
  echo You found Paulo! He is in the %room%.
) else (
  echo Wrong! Paulo is hiding in the %room%.
)

echo.
pause >nul
