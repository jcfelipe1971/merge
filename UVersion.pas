unit UVersion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE}, Windows, SysUtils;

type
  VersionEs = record
     NombreCompania: string; //CompanyName
     Descripcion: string;    //FileDescription
     VersionArchivo: string; //FileVersion
     NombreInterno: string;  //InternalName
     CopyRight: string;      //LegalCopyright
     NombreOriginal: string; //OriginalFilename
     NombreProducto: string; //ProductName
     VersionProducto: string;//ProductVersion
  end;

function VersionInfo(NombreAp: string): VersionEs;

implementation

var
  Info : Pointer;
  Buffer : array [0..50000] of char;
  Tamanyo : cardinal;
  PUint : UInt;
  PunteroC : Pointer;

function VersionInfo(NombreAp: string): VersionEs;
var
  Ver : VersionEs;
  Archivo : array [0..256] of char;
begin
  StrPCopy(Archivo, NombreAp);

  Info := @Buffer;

  Tamanyo := GetFileVersionInfoSize(Archivo, PUint);

  GetFileVersionInfo(Archivo, 0, Tamanyo, Info);

  with Ver do
  begin
     VerQueryValue(Info, ('StringFileInfo\040A04E4\CompanyName'), PunteroC,
        Tamanyo);
     NombreCompania := StrPas(PunteroC); //CompanyName

     VerQueryValue(Info, ('StringFileInfo\040A04E4\FileDescription'), PunteroC,
        Tamanyo);
     Descripcion := StrPas(PunteroC);    //FileDescription

     VerQueryValue(Info, ('StringFileInfo\040A04E4\FileVersion'), PunteroC,
        Tamanyo);
     VersionArchivo := StrPas(PunteroC); //FileVersion

     VerQueryValue(Info, ('StringFileInfo\040A04E4\InternalName'), PunteroC,
        Tamanyo);
     NombreInterno := StrPas(PunteroC);//InternalName

     VerQueryValue(Info, ('StringFileInfo\040A04E4\LegalCopyright'), PunteroC,
        Tamanyo);
     CopyRight := StrPas(PunteroC);//LegalCopyright

     VerQueryValue(Info, ('StringFileInfo\040A04E4\OriginalFileName'), PunteroC,
        Tamanyo);
     NombreOriginal := StrPas(PunteroC);//OriginalFilename

     VerQueryValue(Info, ('StringFileInfo\040A04E4\ProductName'), PunteroC,
        Tamanyo);
     NombreProducto := StrPas(PunteroC);//ProductName

     VerQueryValue(Info, ('StringFileInfo\040A04E4\ProductVersion'), PunteroC,
        Tamanyo);
     VersionProducto := StrPas(PunteroC);//ProductVersion
  end;

  Result := Ver;
end;

end.
