SET STARTUP_DIR="%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
SET BIN_DIR="%USERPROFILE%\bin"

REM ���s�|���V�[���ɘa����
powershell -Command "Set-ExecutionPolicy Unrestricted" >> "%TEMP%\StartupLog.txt" 2>&1

REM DISPLAY���ϐ��̐ݒ�X�N���v�g�����s����
powershell "%BIN_DIR%\Set-DisplayEnvironmentVariable.ps1" >> "%TEMP%\StartupLog.txt" 2>&1

rem Local Variables:
rem coding: cp932-dos
rem End:
