unit UFMTPVConfSincronizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, ULFEdit,
  Grids, DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada;

type
  TFMTPVConfSincronizacion = class(TFPEditSinNavegador)
     ENombreDB: TLFEdit;
     EUsuarioDB: TLFEdit;
     ERolDB: TLFEdit;
     LNombreDB: TLFLabel;
     LUsuarioDB: TLFLabel;
     LRolDB: TLFLabel;
     BtnLeer: TToolButton;
     BtnEscribir: TToolButton;
     EPasswordDB: TLFEdit;
     LPasswordDB: TLFLabel;
     ERutaFicheroSincronizacion: TLFEdit;
     LRutaFicheroSincronizacion: TLFLabel;
     DBGFRutaSerividorSerie: TDBGridFind2000;
     TSep1: TToolButton;
     procedure BtnEscribirClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure GrabaINISicronizacion;
  public
     { Public declarations }
  end;

var
  FMTPVConfSincronizacion : TFMTPVConfSincronizacion;

implementation

uses UEntorno, IniFiles, UDMTPVConfSincronizacion, UFormGest;

{$R *.dfm}

procedure TFMTPVConfSincronizacion.GrabaINISicronizacion;
{
var
  oIni : TIniFile;
}
begin
  // Graba los nuevos Datos

  { ???
  oIni := TIniFile.Create(REntorno.RutaFicheroValoresSinc);
  try
     // Datos
     oIni.WriteString('Datos', 'BaseDeDatos', ENombreDB.Text);
     oIni.WriteString('Datos', 'UsuarioBD', EUsuarioDB.Text);
     oIni.WriteString('Datos', 'PasswordBD', EPasswordDB.Text);
     oIni.WriteString('Datos', 'RolBD', ERolDB.Text);
     oIni.WriteString('Datos', 'RutaFicheroValoresSinc', ERutaFicheroSincronizacion.Text);
  finally
     oIni.Free;
  end;
  }
end;

procedure TFMTPVConfSincronizacion.BtnEscribirClick(Sender: TObject);
begin
  inherited;
  GrabaINISicronizacion;
end;

procedure TFMTPVConfSincronizacion.FormCreate(Sender: TObject);
{
var
  oIni : TIniFile;
  BaseDeDatos, UsuarioBD, PasswordBD, RolBD, RutaFicheroSincronizacion : string;
  fs : TFileStream;
  // strList : TStringList;
  contenido_ini : TextFile;
}
begin
  AbreData(TDMTPVConfSincronizacion, DMTPVConfSincronizacion);

  { ???
  // Si no existe el ini de sincronizacion lo creamos junto al exe
  RutaFicheroSincronizacion := ExtractFilePath(Application.ExeName) + 'TPV-sincronizacion.ini';
  }

  { ???
  if not FileExists(RutaFicheroSincronizacion) then
  begin
     fs := TFileStream.Create(RutaFicheroSincronizacion, fmCreate);
     fs.Free;
     if FileExists(RutaFicheroSincronizacion) then
     begin
        AssignFile(contenido_ini, RutaFicheroSincronizacion);
        Rewrite(contenido_ini);
        WriteLn(contenido_ini, '[Datos]');
        WriteLn(contenido_ini, 'BaseDeDatos=');
        WriteLn(contenido_ini, 'UsuarioBD=SYSDBA');
        WriteLn(contenido_ini, 'PasswordBD=masterkey');
        WriteLn(contenido_ini, 'RolBD=');
        WriteLn(contenido_ini, 'sesion=');
        WriteLn(contenido_ini, 'numeroTicket=');
        WriteLn(contenido_ini, 'modo_trabajo=');
        WriteLn(contenido_ini, 'RutaFicheroValoresSinc=');
        CloseFile(contenido_ini);
        Reset(contenido_ini);
     end;
  end;

  oIni := TIniFile.Create(RutaFicheroSincronizacion);
  try
     BaseDeDatos := oIni.ReadString('Datos', 'BaseDeDatos', BaseDeDatos);
     UsuarioBD := oIni.ReadString('Datos', 'UsuarioBD', UsuarioBD);
     PasswordBD := oIni.ReadString('Datos', 'PasswordBD', PasswordBD);
     RolBD := oIni.ReadString('Datos', 'RolBD', RolBD);

     ENombreDB.Text := BaseDeDatos;
     EUsuarioDB.Text := UsuarioBD;
     EPasswordDB.Text := PasswordBD;
     ERolDB.Text := RolBD;
     ERutaFicheroSincronizacion.Text := RutaFicheroSincronizacion;
  finally
     oIni.Free;
  end;
  }
end;

procedure TFMTPVConfSincronizacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTPVConfSincronizacion);
end;

end.
