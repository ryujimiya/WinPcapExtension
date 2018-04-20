@echo off
set PAUSE_ERRORS=1
call bat\SetupSDK.bat

:: build WinPcapExtension.swc
echo building WinPcapExtension.swc ...
call acompc ^
    -target-player=13 ^
    -source-path src ^
    -include-classes ^
        livefan.winpcap.WinPcapExtension ^
        livefan.winpcap.PcapDefine ^
    -output=bin/WinPcapExtension.swc
if errorlevel 1 goto acompc_error

:: extract library.swc
echo .
echo extracting library.swc ...
echo .
set PATH=%PATH%;C:\Program Files\Git\usr\bin
cd bin
unzip -o WinPcapExtension.swc
cd ..
copy bin\library.swf platform\Windows-x86\ /v /y
copy ..\..\..\WinPcapANEDll\src\WinPcapANEDll\Release\WinPcapANEDll.dll platform\Windows-x86\ /v /y

:: package
echo .
echo generating package ...
echo .
adt -package -storetype pkcs12 -keystore bat/WinPcapExtension.p12 -target ane WinPcapExtension.ane extension.xml -swc bin/WinPcapExtension.swc -platform Windows-x86 -C platform/Windows-x86 .

goto end

:acompc_error
echo .
echo ERROR occured while generating WinPcapExtension.swc
echo .
if %PAUSE_ERRORS%==1 pause
exit

:end
