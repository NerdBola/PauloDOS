@echo off
cls
color 0A
title PauloDOS

echo PauloDOS
echo --------------------
echo Generic Batch Runner
echo.

echo Comandos:
echo   HELP
ECHO   CLS
echo   RUN programa.bat
echo   EXIT
echo.

goto :prompt

:show_help
echo.
echo Comandos disponiveis:
echo   RUN programa.bat
ECHO   RUN programa
echo   RUN "C:\caminho\programa.bat"
echo   CLS
echo   HELP
echo   EXIT
echo.
exit /b

:prompt
set /p "cmd=PauloDOS> "

if /i "%cmd%"=="EXIT" (
  cls
  echo Ate logo!
  exit /b
)

if /i "%cmd%"=="QUIT" (
  cls
  echo Ate logo!
  exit /b
)

if /i "%cmd%"=="HELP" (
  call :show_help
  goto :prompt
)

if /i "%cmd%"=="CLS" (
  cls
  goto :prompt
)

if /i "%cmd:~0,3%"=="RUN" (
  call :run_program "%cmd:~4%"
  goto :prompt
)

echo Comando invalido: %cmd%
echo Digite HELP para ver os comandos.
echo.
goto :prompt

:run_program
set "target=%~1"
set "target=%target:"=%"

if "%target%"=="" (
  echo Uso: RUN programa.bat
  echo Exemplo: RUN test.bat
  echo.
  exit /b
)

if exist "%target%" (
  echo.
  echo Executando: %target%
  echo.
  cls
  call "%target%"
  echo.
  echo Pressione qualquer tecla para voltar ao PauloDOS...
  pause >nul
  cls
  exit /b
)

if exist "%~dp0%target%" (
  echo.
  echo Executando: %~dp0%target%
  echo.
  cls
  call "%~dp0%target%"
  echo.
  echo Pressione qualquer tecla para voltar ao PauloDOS...
  pause >nul
  cls
  exit /b
)

if exist "%target%.bat" (
  echo.
  echo Executando: %target%.bat
  echo.
  cls
  call "%target%.bat"
  echo.
  echo Pressione qualquer tecla para voltar ao PauloDOS...
  pause >nul
  cls
  exit /b
)

if exist "%~dp0%target%.bat" (
  echo.
  echo Executando: %~dp0%target%.bat
  echo.
  cls
  call "%~dp0%target%.bat"
  echo.
  echo Pressione qualquer tecla para voltar ao PauloDOS...
  pause >nul
  cls
  exit /b
)

echo Programa nao encontrado: %target%
echo Exemplo: RUN test.bat
echo.
exit /b
