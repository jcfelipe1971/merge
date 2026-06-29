cls
Java -jar "C:\Delfos\PortableSigner\PortableSigner.jar" -n -s C:\Delfos\PortableSigner\CERTIFICADO.pfx -p "CLAVE" -t C:\Delfos\PortableSigner\Factura_A_123.pdf -o C:\Delfos\PortableSigner\Factura_A_123-Firmado.pdf
ECHO %ERRORLEVEL%
PAUSE