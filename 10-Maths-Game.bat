@echo off
cls
echo.
echo 10 Maths Game
echo -------------
set /a score=0
set /a q=1

:loop
if %q% gtr 10 goto finish
set /a a=%random% %% 20 + 1
set /a op=%random% %% 2
if %op%==0 (
  set /a b=%random% %% 20 + 1
  set /a answer=a+b
  set "symbol=+"
  set /p "user=Q%q%: %a% %symbol% %b% = "
) else (
  set /a b=%random% %% %a% + 1
  set /a answer=a-b
  set "symbol=-"
  set /p "user=Q%q%: %a% %symbol% %b% = "
)

if "%user%"=="%answer%" (
  set /a score+=1
  echo Correct! Score: %score%
) else (
  echo Wrong! Correct answer is %answer%
)

set /a q+=1
goto loop

:finish
echo.
echo Final score: %score%/10
echo.
pause >nul
