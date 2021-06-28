@echo off

color 0e

set _color="%cd%\bin\cocolor.exe"

set extractRAR="%~dp0bin\rar.exe" -y x
set extractZIP="%~dp0bin\unzip.exe" -o

set sleep="%~dp0bin\wait.exe"
set rm=rmdir /s /q

set adb="..\..\bin\adb.exe"

set appName=0
set choice=2

set install=%adb% install
set uninstall=%adb% uninstall
set push=%adb% push
set pull=%adb% pull
set shell=%adb% shell

set dumpFolder="%temp%\firestick-loader\sdcard-dump"

set swipeUp=%shell% input swipe 200 900 200 300
set keyEnter=%shell% input keyevent 66
set keyTab=%shell% input keyevent 61


set sdcard=sdcard
::set sdcard=external_sd
::set sdcard=extSdCard

if exist %dumpFolder% rd /q /s %dumpFolder%
mkdir %dumpFolder%

echo.
echo.
echo.
echo Dumping From /%sdcard%/...
echo.
echo.



%shell% "su -c rm -r %sdcard%/com.amazon.device.settings"
%shell% "su -c rm -r %sdcard%/com.amazon.providers.contentsupport"
%shell% "su -c rm -r %sdcard%/com.amazon.tv.ime"
%shell% "su -c rm -r %sdcard%/com.amazon.tv.launcher"
%shell% "su -c rm -r %sdcard%/com.amazon.tv.oobe"
%shell% "su -c rm -r %sdcard%/com.amazon.tv.settings"
%shell% "su -c rm -r %sdcard%/com.amazon.tv.settings.core"
%shell% "su -c rm -r %sdcard%/com.amazon.tv.settings.v2"
%shell% "su -c rm -r %sdcard%/com.amazon.venezia"

%shell% "su -c cp -R /data/data/com.amazon.device.settings /%sdcard%/com.amazon.device.settings"
%shell% "su -c cp -R /data/data/com.amazon.providers.contentsupport /%sdcard%/com.amazon.providers.contentsupport"
%shell% "su -c cp -R /data/data/com.amazon.tv.ime /%sdcard%/com.amazon.tv.ime"
%shell% "su -c cp -R /data/data/com.amazon.tv.launcher /%sdcard%/com.amazon.tv.launcher"
%shell% "su -c cp -R /data/data/com.amazon.tv.oobe /%sdcard%/com.amazon.tv.oobe"
%shell% "su -c cp -R /data/data/com.amazon.tv.settings /%sdcard%/com.amazon.tv.settings"
%shell% "su -c cp -R /data/data/com.amazon.tv.settings /%sdcard%/com.amazon.tv.settings.core"
%shell% "su -c cp -R /data/data/com.amazon.tv.settings /%sdcard%/com.amazon.tv.settings.v2"
%shell% "su -c cp -R /data/data/com.amazon.venezia /%sdcard%/com.amazon.venezia"

%shell% "su -c mkdir -p %sdcard%/com.amazon.device.settings"
%shell% "su -c mkdir -p %sdcard%/com.amazon.providers.contentsupport"
%shell% "su -c mkdir -p %sdcard%/com.amazon.tv.ime"
%shell% "su -c mkdir -p %sdcard%/com.amazon.tv.launcher"
%shell% "su -c mkdir -p %sdcard%/com.amazon.tv.oobe"
%shell% "su -c mkdir -p %sdcard%/com.amazon.tv.settings"
%shell% "su -c mkdir -p %sdcard%/com.amazon.tv.settings.core"
%shell% "su -c mkdir -p %sdcard%/com.amazon.tv.settings.v2"
%shell% "su -c mkdir -p %sdcard%/com.amazon.venezia"

%pull% %sdcard%/com.amazon.device.settings %dumpFolder%/com.amazon.device.settings
%pull% %sdcard%/com.amazon.providers.contentsupport %dumpFolder%/com.amazon.providers.contentsupport
%pull% %sdcard%/com.amazon.tv.ime %dumpFolder%/com.amazon.tv.ime
%pull% %sdcard%/com.amazon.tv.launcher %dumpFolder%/com.amazon.tv.launcher
%pull% %sdcard%/com.amazon.tv.oobe %dumpFolder%/com.amazon.tv.oobe
%pull% %sdcard%/com.amazon.tv.settings %dumpFolder%/com.amazon.tv.settings
%pull% %sdcard%/com.amazon.tv.settings %dumpFolder%/com.amazon.tv.settings.core
%pull% %sdcard%/com.amazon.tv.settings %dumpFolder%/com.amazon.tv.settings.v2
%pull% %sdcard%/com.amazon.venezia %dumpFolder%/com.amazon.venezia

start "" explorer %dumpFolder%

:end



