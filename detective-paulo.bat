@echo off
cls
echo.
echo Detective Paulo
echo ---------------
echo A mystery case has started!
echo.
echo Clues:
echo 1. Paulo likes numbers.
echo 2. He was last seen near a place with books.
echo 3. He hid in a room with a "P".
echo.
set /a answer=(%random% %% 5) + 1
if %answer%==1 set "location=Library"
if %answer%==2 set "location=Park"
if %answer%==3 set "location=Bedroom"
if %answer%==4 set "location=Kitchen"
if %answer%==5 set "location=Garage"

echo Choose a place:
echo 1) Library
echo 2) Park
echo 3) Bedroom
echo 4) Kitchen
echo 5) Garage
set /p "guess=Detective choice: "

if "%guess%"=="%answer%" (
  echo You solved the case! Paulo was in the %location%.
) else (
  echo Case unsolved. Paulo was in the %location%.
)

echo.
pause >nul
