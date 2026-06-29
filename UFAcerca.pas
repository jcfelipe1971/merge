unit UFAcerca;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, jpeg, ULFPanel, ULFLabel, FIBDatabase,
  UFIBModificados, DB, FIBDataSet, FIBTableDataSet, Grids, DBGrids,
  ULFPageControl;

type
  TFAcerca = class(TForm)
     LBLSistema: TLFLabel;
     LBLMemoria: TLFLabel;
     PNLEspe: TLFPanel;
     LBLEmpresa: TLFLabel;
     LBLVersionBD: TLFLabel;
     LBLCopyRight: TLFLabel;
     LBLNombreProducto: TLFLabel;
     LBLTEmpresa: TLFLabel;
     LBLTVersionBD: TLFLabel;
     LBLTCopyRight: TLFLabel;
     LBLTNombreProducto: TLFLabel;
     LBLMem: TLFLabel;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     LBLCompilacion: TLFLabel;
     LBLTCompilacion: TLFLabel;
     LVersionEjecutable: TLFLabel;
     LBLTVersionEXE: TLFLabel;
     BBSalir: TBitBtn;
     Z_LblBBDD: TLFLabel;
     DBGVersiones: TDBGrid;
     FIBVersiones: TFIBTableSet;
     FIBVersionesTIPO_REVISION: TFIBStringField;
     FIBVersionesACTUALIZACION: TIntegerField;
     DSFIBVersiones: TDataSource;
     TLocal: THYTransaction;
     TimerActualizaMemoria: TTimer;
     LDireccionIP: TLFLabel;
     LTDireccionIP: TLFLabel;
     PNLRevisiones: TLFPanel;
     PNLDatosSistema: TLFPanel;
     PNLDatosEjecutable: TLFPanel;
     PNLDatos: TLFPanel;
     PNLBoton: TLFPanel;
     LTDireccionIPPublica: TLFLabel;
     LDireccionIPPublica: TLFLabel;
     LEntrada: TLFLabel;
     LBLEntrada: TLFLabel;
     LMACServidor: TLFLabel;
     LTMACServidor: TLFLabel;
     LLicencia: TLFLabel;
     LTLicencia: TLFLabel;
     LCorreoLicencia: TLFLabel;
     LTCorreoLicencia: TLFLabel;
     LTLocalAppData: TLFLabel;
     LLocalAppData: TLFLabel;
     LAppData: TLFLabel;
     LTAppData: TLFLabel;
     PNLDeclResponsable: TLFPanel;
     REDeclResponsable: TRichEdit;
     PCMain: TLFPageControl;
     TSAcerca: TTabSheet;
     TSDeclResponsable: TTabSheet;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TimerActualizaMemoriaTimer(Sender: TObject);
     procedure DBGVersionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FAcerca : TFAcerca;

implementation

uses UVersion, UUtiles, UDameDato, UEntorno, UDMMain, UFMain, DateUtils, UImagenes;

{$R *.DFM}

procedure TFAcerca.FormCreate(Sender: TObject);
var
  Info : VersionEs;
  VersionBaseDeDatos, Empresa, Copyright, NombreProducto : string;
  Mayor, Minor, Release, Build : word;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  PCMain.ActivePage := TSAcerca;

  RefrescarImagen(Imagen, -3);

  LBLEntrada.Caption := REntorno.EntradaStr;
  LBLSistema.Caption := REntorno.Sistema;

  Info := VersionInfo(Application.ExeName);
  LBLTEmpresa.Caption := Info.NombreCompania;
  LBLTCompilacion.Caption := Info.VersionArchivo;

  DMMain.DatosVersion(VersionBaseDeDatos, Empresa, Copyright, NombreProducto, True);
  LBLTCopyRight.Caption := Copyright;
  LBLTNombreProducto.Caption := NombreProducto;
  LBLTEmpresa.Caption := Empresa;

  LBLTVersionBD.Caption := VersionBaseDeDatos;

  // Version - Mayor: año; Minor: version
  GetBuildInfo(REntorno.RutaEXE + REntorno.FicheroExe, Mayor, Minor, Release, Build);
  LBLTVersionEXE.Caption := IntToStr(Minor);

  LTDireccionIP.Caption := DameIPLocal;
  LTDireccionIPPublica.Caption := DameIPPublica;
  LTMACServidor.Caption := DMMain.MACServidor + ' (' + DMMain.IP_Servidor + ')';
  LTLicencia.Caption := DameLicencia;
  LTCorreoLicencia.Caption := DameEmailLicencia;

  LTLocalAppData.Caption := GetSpecialFolderPath(CSIDL_LOCAL_APPDATA, False);
  LTAppData.Caption := GetSpecialFolderPath(CSIDL_APPDATA, False);
  LTLocalAppData.Hint := LTLocalAppData.Caption;
  LTAppData.Hint := LTAppData.Caption;

  if (LBLTVersionBD.Caption <> IntToStr(Minor)) then
  begin
     ColorError(LBLTVersionBD);
     ColorError(LBLTVersionEXE);
  end;

  try
     if not TLocal.Active then
        TLocal.StartTransaction;
     FIBVersiones.Open;
  except
  end;

  BBSalir.Left := (Self.Width div 2) - (BBSalir.Width div 2);

  // Asigno Imagenes a BitdBtn
  GetBitmapFromImageList(BBSalir, 1, DMMain.ILMain_Ac, 19);

  TimerActualizaMemoria.Enabled := True;
end;

procedure TFAcerca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFAcerca.TimerActualizaMemoriaTimer(Sender: TObject);
var
  MS : TMemoryStatus;
begin
  MS.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MS);
  LBLMem.Caption := Format(_('%d KB de %d KB'), [MS.dwAvailPhys div 1024, MS.dwTotalPhys div 1024]);
end;

procedure TFAcerca.DBGVersionesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  with TDBGrid(Sender) do
  begin
     if (FIBVersionesTIPO_REVISION.AsString = 'DLF') then
        ColorResaltado2(TDBGrid(Sender).Canvas)
     else
        ColorNormal(TDBGrid(Sender).Canvas);

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFAcerca.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
     Close;
end;

procedure TFAcerca.FormShow(Sender: TObject);
begin
  // Obtengo version y fecha de revision
  try
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT DECL_RESPONSABLE, ');
              SelectSQL.Add('        (SELECT FIRST 1 FECHA ');
              SelectSQL.Add('         FROM SYS_REVISIONES ');
              SelectSQL.Add('         ORDER BY FECHA DESC) FECHA ');
              SelectSQL.Add(' FROM SYS_CONSTANTES ');
              Open;
              REDeclResponsable.Lines.Assign(FieldByName('DECL_RESPONSABLE'));
              REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@fecha', FormatDateTime('dd/mm/yyyy', FieldByName('FECHA').AsDateTime), []);
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  except
  end;

  // Reemplazo variables en el texto (si existen)
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@sistema', LBLTNombreProducto.Caption, []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@identificador', '01', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@version', LBLTVersionEXE.Caption, []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@razon_social', LBLTEmpresa.Caption, []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@nif', 'B67287797', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@direccion', 'Diputacion, 211 - 08011 Barcelona', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@lugar', 'Barcelona', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@email', 'info@delfosonline.cat', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@telefono', '+34 66 44 73 102', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@whatsapp', '', []);
  REDeclResponsable.Lines.Text := StringReplace(REDeclResponsable.Lines.Text, '@web', '', []);
end;

end.
