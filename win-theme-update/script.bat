:: version 0.1
:: source https://stackoverflow.com/questions/21809027/batch-file-run-cmd1-if-time-10pm-4am-else-run-cmd2


@echo off
  setlocal enableextensions disabledelayedexpansion

  set "now=%time: =0%"

  set "task=day"
  :: update the task time in this section, follow the time format
  if "%now%" lss "06:30:00,00" ( set "task=night" )
  if "%now%" geq "18:30:00,00" ( set "task=night" )

  call :task_%task%

  endlocal
  exit /b

:task_day
  reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 1 /f
  goto :eof

:task_night
  reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 0 /f
  goto :eof
