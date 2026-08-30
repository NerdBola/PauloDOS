@echo off
setlocal enabledelayedexpansion
color 0B
cls

echo.
echo  MYST
echo  ---------------------
echo  Welcome to MYST
echo  A forgotten island is waiting for you.
echo  Gather the clues, solve the final code,
echo  and unlock the hidden door.
echo.
pause >nul

set "has_map=0"
set "has_lantern=0"
set "has_rune=0"
set "has_seal=0"

:menu
cls
echo.
echo  MYST
ECHO  ---------------------
echo  1) Enter the Atrium
ECHO  2) Visit the Library
ECHO  3) Climb to the Observatory
ECHO  4) Walk to the Dock
ECHO  5) Unlock the Hidden Door
ECHO  6) Quit
ECHO.
set /p "choice=Choose a place: "

if /i "%choice%"=="1" call :atrium
if /i "%choice%"=="2" call :library
if /i "%choice%"=="3" call :observatory
if /i "%choice%"=="4" call :dock
if /i "%choice%"=="5" call :door
if /i "%choice%"=="6" goto :end

echo Invalid option.
pause >nul
goto :menu

:atrium
echo.
echo You enter the Atrium.
if "%has_map%"=="0" (
  echo A stone plaque reads: "The path begins where memory sleeps."
  echo A dusty map falls from the wall.
  set "has_map=1"
  echo You picked up the map.
) else (
  echo The atrium is silent. The map is already yours.
)
pause >nul
goto :menu

:library
echo.
echo You step into the Library.
if "%has_lantern%"=="0" (
  echo A locked cabinet sits under a shelf of old books.
  echo A note says: "The answer shines in the dark."
  set /p "answer=What do you use to see in the dark? "
  if /i "!answer!"=="lantern" (
    set "has_lantern=1"
    echo Correct! You take a lantern and a silver page.
    echo The page whispers: "The final rune waits above the stars."
  ) else (
    echo The books whisper: "Not that one... try a lantern."
  )
) else (
  echo The library is quiet, but the lantern still glows in your hand.
)
pause >nul
goto :menu

:observatory
echo.
echo You climb to the Observatory.
if "%has_rune%"=="0" (
  echo Above you, the night sky sparkles with countless lights.
  set /p "rune_answer=What do you count in the sky at night? "
  if /i "!rune_answer!"=="stars" (
    set "has_rune=1"
    echo Correct! A glowing rune falls into your hands.
  ) else (
    echo The telescope hums: "Try the stars."
  )
) else (
  echo The observatory is calm. The rune is already yours.
)
pause >nul
goto :menu

:dock
echo.
echo You walk to the Dock.
if "%has_seal%"=="0" (
  echo A cracked wooden sign reads: "To cross the water, you need a vessel."
  set /p "boat_answer=What carries people across water? "
  if /i "!boat_answer!"=="boat" (
    set "has_seal=1"
    echo You find a golden seal and a hidden key.
  ) else (
    echo The waves answer: "A boat is the answer."
  )
) else (
  echo The dock is empty now. The seal is already in your pocket.
)
pause >nul
goto :menu

:door
echo.
if "%has_map%"=="1" if "%has_lantern%"=="1" if "%has_rune%"=="1" if "%has_seal%"=="1" (
  echo The ancient door rises before you.
  echo A phrase appears on the stone: "Myst is the answer."
  set /p "code=Enter the final code: "
  if /i "%code%"=="MYST" (
    cls
    echo.
    echo  Congratulations!
    echo  ----------------
    echo  You solved the mystery and opened the hidden chamber.
    echo  The island reveals its secret: Paulo was never lost.
    echo  You have completed MYST.
    echo.
    pause >nul
    exit /b
  ) else (
    echo The door remains shut. The code is not correct.
  )
) else (
  echo The hidden door is locked.
  echo You still need: map, lantern, rune, and seal.
)
pause >nul
goto :menu

:end
echo.
echo Thank you for visiting MYST.
exit /b
