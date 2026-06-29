@echo off
rem ver 160316
rem ----------------------------------------------------------------------
rem espera : Para TServer. Hace 2 pings antes de empezar. (Para lanzar impresoras).
rem nombre_ori : nombre del Ejecutable origen, sin extension.
rem nombre_des : nombre del Ejecutable en local, sin extension. Normalmente igual a nombre_ori.
rem dir_ori : carpeta donde se encuentran los archivos a copiar.
rem copia_ayuda : copia la ayuda al directorio temporal.
rem copia_bpl : Copiar las bpl en local.
rem copia_ini : Copiar el ini en local.
rem copia_lang : Copiar los lenguajes en local.
rem copia_mode : Copiar los modelos de hacienda.
rem dir_des : Carpeta destino, por defecto el temporal, pero se puede especificar otra.
rem ParametrosEjecutable : parametros que se pueden pasar al ejecutable 
rem                        /nologo - No muestra el logo al iniciar la aplicacion (TServer)
rem                        /nobackgroud - Inicia la aplicacion sin fondo (TServer)
rem mantenimiento : Evita que se ejecute la aplicacion
rem ----------------------------------------------------------------------

set espera=NO
set copia_ayuda=SI
set copia_ini=NO
set copia_bpl=SI
set copia_lang=SI
set copia_mode=SI
set nombre_ori=AdmXXI-664
set nombre_des=G2K2Plus
set dir_ori=\\192.168.0.13\samba\Dikram\Ejecutables
set dir_des=%temp%
set ParametrosEjecutable=
set mantenimiento=NO

if "%mantenimiento%"=="SI" goto MANTENIMIENTO

cls

echo *******************************************************************************
echo ***                         Iniciando ADMINISTRA XXI                        ***
echo ***                        Por favor espere ...                             ***
echo *******************************************************************************

rem /************ CREAMOS CARPETA DESTINO ****************/
if exist %dir_des% goto NoCreaDirDestino
   mkdir %dir_des% > nul.txt
:NoCreaDirDestino
rem /************ CREAMOS CARPETA DESTINO ****************/

rem /************ ESPERA ****************/
echo *                                   10                                        *
if "%espera%"=="NO" goto FinPING1
   ping localhost > nul.txt
:FinPING1

echo *                                    9                                        *
if "%espera%"=="NO" goto FinPING2
   ping localhost > nul.txt
:FinPING2
rem /************ ESPERA ****************/

rem /************ COPIA IDIOMAS ****************/
echo *                                    8                                        *
if "%copia_lang%"=="NO" goto FinCopia_lang
xcopy %dir_ori%\lang %dir_des%\lang /s /i /y /q > nul.txt
:FinCopia_lang
rem /************ COPIA IDIOMAS ****************/

rem /*********** COPIA EXE + DLL ***************/
echo *                                    7                                        *
copy %dir_ori%\%nombre_ori%.exe %dir_des%\%nombre_des%.exe /y > nul
copy %dir_ori%\openssl.exe %dir_des%\openssl.exe /y > nul
copy %dir_ori%\ssleay32.dll %dir_des%\ssleay32.dll /y > nul
copy %dir_ori%\libeay32.dll %dir_des%\libeay32.dll /y > nul
rem /************ COPIA EXE ****************/

rem /************ COPIA BPLS ****************/
if "%copia_bpl%"=="NO" goto FinCopia_bpl
echo *                                    6                                        *
copy %dir_ori%\ImageList.bpl %dir_des%\ImageList.bpl /y > nul.txt

echo *                                    5                                        *
copy %dir_ori%\rtl60.bpl %dir_des%\rtl60.bpl /y > nul.txt

echo *                                    4                                        *
copy %dir_ori%\vcl60.bpl %dir_des%\vcl60.bpl /y > nul.txt
:FinCopia_bpl

if "%copia_bpl%"=="SI" goto FinCopia_bpl2
echo *                                    6                                        *
echo *                                    5                                        *
echo *                                    4                                        *
:FinCopia_bpl2
rem /************ COPIA BPLS ****************/

rem /************ COPIA INI ****************/
echo *                                    3                                        *
if "%copia_ini%"=="NO" goto FinCopia_Ini
   copy %dir_ori%\%nombre_ori%.ini %dir_des%\%nombre_des%.ini /y > nul.txt
:FinCopia_Ini
rem /************ COPIA INI ****************/

rem /************ COPIA LANG ***************/
echo *                                    2.5                                      *

xcopy %dir_ori%\Lang\* %dir_des%\Lang\* /T /E /I /Y > nul.txt

copy %dir_ori%\Lang\ca\delphi.mo %dir_des%\Lang\ca\delphi.mo /y > nul.txt
copy %dir_ori%\Lang\ca\G2k2Plus.mo %dir_des%\Lang\ca\%nombre_des%.mo /y > nul.txt

copy %dir_ori%\Lang\en\delphi.mo %dir_des%\Lang\en\delphi.mo /y > nul.txt
copy %dir_ori%\Lang\en\G2k2Plus.mo %dir_des%\Lang\en\%nombre_des%.mo /y > nul.txt

copy %dir_ori%\Lang\es\delphi.mo %dir_des%\Lang\es\delphi.mo /y > nul.txt
copy %dir_ori%\Lang\es\G2k2Plus.mo %dir_des%\Lang\es\%nombre_des%.mo /y > nul.txt

copy %dir_ori%\Lang\es_CH\delphi.mo %dir_des%\Lang\es_CH\delphi.mo /y > nul.txt
copy %dir_ori%\Lang\es_CH\G2k2Plus.mo %dir_des%\Lang\es_CH\%nombre_des%.mo /y > nul.txt

copy %dir_ori%\Lang\es_DO\delphi.mo %dir_des%\Lang\es_DO\delphi.mo /y > nul.txt
copy %dir_ori%\Lang\es_DO\G2k2Plus.mo %dir_des%\Lang\es_DO\%nombre_des%.mo /y > nul.txt

copy %dir_ori%\Lang\es_MX\delphi.mo %dir_des%\Lang\es_MX\delphi.mo /y > nul.txt
copy %dir_ori%\Lang\es_MX\G2k2Plus.mo %dir_des%\Lang\es_MX\%nombre_des%.mo /y > nul.txt

rem /************ EJECUCION PROGRAMA ****************/
echo *                                    2                                        *
start %dir_des%\%nombre_des%.exe %ParametrosEjecutable%
rem /************ EJECUCION PROGRAMA ****************/

rem /************ COPIA MODELOS HACIENDA ****************/
if "%copia_mode%"=="NO" goto FinCopia_mode
echo *                                    1                                        *
if exist %dir_des%\ModelosHacienda goto NoCreaDirModelosHacienda
   mkdir %dir_des%\ModelosHacienda > nul.txt
:NoCreaDirModelosHacienda

if exist %dir_des%\ModelosHacienda\Datos goto NoCreaDirModelosHaciendaDatos
   mkdir %dir_des%\ModelosHacienda\Datos > nul.txt
:NoCreaDirModelosHaciendaDatos

echo *                                    0                                        *
copy %dir_ori%\ModelosHacienda\*.* %dir_des%\ModelosHacienda\*.* /y > nul.txt
copy %dir_ori%\ModelosHacienda\Datos\*.* %dir_des%\ModelosHacienda\Datos\*.* /y > nul.txt
:FinCopia_mode

if "%copia_mode%"=="SI" goto FinCopia_mode2
echo *                                    1                                        *
echo *                                    0                                        *
:FinCopia_mode2
rem /************ COPIA MODELOS HACIENDA ****************/

rem del %temp%\ReportesDeUsUario.exe /f /q > nul.txt
echo *                                    .                                        *
copy %dir_ori%\ReportesDeUsuario.exe %temp%\ReportesDeUsUario.exe /y > nul.txt

rem /************ COPIA AYUDA ****************/
if "%copia_ayuda%"=="NO" goto FinAyuda
echo *                                    .                                        *
   copy %dir_ori%\%nombre_ori%.chm %dir_des%\%nombre_des%.chm /y > nul.txt
echo *                                    .                                        *
   copy %dir_ori%\%nombre_ori%.cnt %temp%\g2k2plus.cnt /y > nul.txt
echo *                                    .                                        *
   copy %dir_ori%\%nombre_ori%.gid %temp%\g2k2plus.gid /y > nul.txt
echo *                                    .                                        *
   copy %dir_ori%\%nombre_ori%.hlp %temp%\%nombre_des%.hlp /y > nul.txt
echo *                                    .                                        *
   copy %dir_ori%\ROBOEX32.DLL %temp%\ROBOEX32.DLL /y > nul.txt
:FinAyuda
rem /************ COPIA AYUDA ****************/

rem /********** COPIA PDFSigner ***************/
copy %dir_ori%\PDFSigner.jar %dir_des%\PDFSigner.jar /y > nul
rem /********** COPIA PDFSigner ***************/

rem /********** COPIA PortableSigner ***************/
if exist %dir_des%\PortableSigner goto NoCreaPortableSigner
   mkdir %dir_des%\PortableSigner > nul
   mkdir %dir_des%\PortableSigner\lib > nul
:NoCreaPortableSigner
copy %dir_ori%\PortableSigner %dir_des%\PortableSigner /y > nul
copy %dir_ori%\PortableSigner\lib %dir_des%\PortableSigner\lib /y > nul
rem /********** COPIA PortableSigner ***************/

GOTO FIN

:MANTENIMIENTO

cls
echo *******************************************************************************
echo ***                         Iniciando ADMINISTRA XXI                        ***
echo ***                                                                         ***
echo ***                                                                         ***
echo ***                                                                         ***
echo ***                         En mantenimiento                                ***
echo ***                                                                         ***
echo ***                                                                         ***
echo ***                                                                         ***
echo ***                                                                         ***
echo *******************************************************************************

pause

:FIN