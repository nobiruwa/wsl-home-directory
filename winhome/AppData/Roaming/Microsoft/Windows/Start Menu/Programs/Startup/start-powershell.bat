SET STARTUP_DIR="%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
SET BIN_DIR="%USERPROFILE%\bin"

REM 実行ポリシーを緩和する
powershell -Command "Set-ExecutionPolicy Unrestricted" >> "%TEMP%\StartupLog.txt" 2>&1

REM DISPLAY環境変数の設定スクリプトを実行する
powershell "%BIN_DIR%\Set-DisplayEnvironmentVariable.ps1" >> "%TEMP%\StartupLog.txt" 2>&1

rem Local Variables:
rem coding: cp932-dos
rem End:
