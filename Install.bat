@echo off
echo LogWalker Tool Setup Start...

::check java env
@echo off
if not exist "%windir%\system32\java.exe" (
  
   if not exist "%windir%SysWOW64\java.exe" (
     echo No JDK found, please install JDK
	 pause
	 exit
   )
   copy "%windir%SysWOW64\java.exe" "%windir%\system32\java.exe"

)


::check tool folder
if not exist "c:\LogWalker\" (
    md "c:\LogWalker\"
)

::check script jar
if exist "c:\LogWalker\logwalker.jar" (
    del c:\LogWalker\logwalker.jar
)
echo copy logwalker.jar to c:\LogWalker\
copy logwalker.jar c:\LogWalker\

::check jxl.jar
if not exist "c:\LogWalker\lib\" (
    md "c:\LogWalker\lib\"
)

if exist "c:\LogWalker\lib\jxl.jar" (
    del c:\LogWalker\lib\jxl.jar
)
echo copy jxl.jar to c:\LogWalker\lib\
copy jxl.jar c:\LogWalker\lib\


::check script bat
if exist "c:\LogWalker\run.bat" (
    del c:\LogWalker\run.bat
)
echo copy run.bat to c:\LogWalker\
copy run.bat c:\LogWalker\

::check script ini 
::if exist "c:\LogWalker\keywords.ini" (
::    del c:\LogWalker\keywords.ini
::)
::echo copy keywords.ini to c:\LogWalker\
::copy keywords.ini c:\LogWalker\

::check script ini 
if exist "c:\LogWalker\Introduction.txt" (
    del c:\LogWalker\Introduction.txt
)
echo copy Introduction.txt to c:\LogWalker\
copy Introduction.txt c:\LogWalker\



::check script ini 
if exist "c:\LogWalker\Logwalker_Tool_User_Guide.docx" (
::    del c:\LogWalker\Logwalker_Tool_User_Guide.docx
  echo exist, just skip.
)else (
   echo copy Logwalker_Tool_User_Guide.docx to c:\LogWalker\
copy Logwalker_Tool_User_Guide.docx c:\LogWalker\
)

::check cfg file
if exist "c:\LogWalker\Log_Analyzer_Configuration.xls" (
    del c:\LogWalker\Log_Analyzer_Configuration.xls
)
echo copy Log_Analyzer_Configuration.xls to c:\LogWalker\
copy Log_Analyzer_Configuration.xls c:\LogWalker\

::register to REG
@echo off 
echo Windows Registry Editor Version 5.00>>temp.reg
echo.>>temp.reg 
echo [HKEY_CLASSES_ROOT\Directory\shell\logwalker]>>temp.reg
echo @="LogWalker">>temp.reg
echo.>>temp.reg
echo [HKEY_CLASSES_ROOT\Directory\shell\logwalker\command]>>temp.reg
echo @="c:\\LogWalker\\run.bat \"%%l\"" >> temp.reg
echo.>>temp.reg 
echo [HKEY_CLASSES_ROOT\*\shell\logwalker]>>temp.reg
echo @="LogWalker">>temp.reg
echo.>>temp.reg
echo [HKEY_CLASSES_ROOT\*\shell\logwalker\command]>>temp.reg
echo @="c:\\LogWalker\\run.bat \"%%l\"" >> temp.reg

@echo off
c:\windows\regedit -s temp.reg
del  temp.reg

echo success.

::if exist "c:\LogWalker\Introduction.txt" (
::    start c:\LogWalker\Introduction.txt
::)

PAUSE
