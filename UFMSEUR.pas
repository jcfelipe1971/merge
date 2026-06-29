unit UFMSEUR;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, ULFDBEdit, Mask, DBCtrls,
  UFIBDBEditfind, ULFFIBDBEditFind, ULFLabel, UComponentesBusquedaFiltrada,
  Buttons;

type
  TFMSEUR = class(TFPEdit)
     LAcreedor: TLFLabel;
     LCodigoIntegracion: TLFLabel;
     LCodigoCliente: TLFLabel;
     LNumeroBulto: TLFLabel;
     LLimiteInferiorBulto: TLFLabel;
     LLimiteSuperiorBulto: TLFLabel;
     DBECodigoIntegracion: TLFDbedit;
     DBECodigoCliente: TLFDbedit;
     DBENumeroBulto: TLFDbedit;
     DBELimiteInferiorBulto: TLFDbedit;
     DBELimiteSuperiorBulto: TLFDbedit;
     ETituloAcreedor: TLFEdit;
     DBEAcreedor: TDBEditFind2000;
     LConfiguracionAPI: TLFLabel;
     LGrantType: TLFLabel;
     DBEGrantType: TLFDbedit;
     LCLientId: TLFLabel;
     DBECLientId: TLFDbedit;
     LClientSecret: TLFLabel;
     DBEClientSecret: TLFDbedit;
     LUserName: TLFLabel;
     DBEUserName: TLFDbedit;
     LPassword: TLFLabel;
     DBEPassword: TLFDbedit;
     LConfiguracionCliente: TLFLabel;
     LCCC: TLFLabel;
     LIdNumber: TLFLabel;
     LBussinesUnit: TLFLabel;
     DBECCC: TLFDbedit;
     DBEIdNumber: TLFDbedit;
     DBEBussinesUnit: TLFDbedit;
     LConfiguracionSender: TLFLabel;
     LName: TLFLabel;
     DBEName: TLFDbedit;
     LPhone: TLFLabel;
     DBEPhone: TLFDbedit;
     LStreetName: TLFLabel;
     DBEStreetName: TLFDbedit;
     LPostCode: TLFLabel;
     DBEPostCode: TLFDbedit;
     LCountry: TLFLabel;
     DBECountry: TLFDbedit;
     LCity: TLFLabel;
     DBECity: TLFDbedit;
     LConfiguracionOtros: TLFLabel;
     BPruebasAPI: TButton;
     LToken: TLFLabel;
     LExpiracion: TLFLabel;
     DBEAcessToken: TLFDbedit;
     DBEExpiracion: TLFDbedit;
     LRutaCopiaEtiqueta: TLFLabel;
     ERutaCopiaEtiqueta: TLFEdit;
     SBDirectorioCopiaEtiqueta: TSpeedButton;
     LGestion: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure DBEAcreedorChange(Sender: TObject);
     procedure DBEAcreedorDblClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure BPruebasAPIClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure SBDirectorioCopiaEtiquetaClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSEUR : TFMSEUR;

implementation

uses UDMSEUR, UEntorno, UDMMain, UFormGest, UFMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMSEUR.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSEUR, DMSEUR);
  NavMain.DataSource := DMSEUR.DSxSEURTransportista;
  DBGMain.DataSource := DMSEUR.DSxSEURTransportista;
  G2kTableLoc.DataSource := DMSEUR.DSxSEURTransportista;

  GetBitmapFromImageList(SBDirectorioCopiaEtiqueta, 1, DMMain.ILMain_Ac, 65);
  ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(LeeDatoIni('SEUR', 'RutaCopiaEtiqueta', GetSpecialFolderPath(CSIDL_PERSONAL, True)));
end;

procedure TFMSEUR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSEUR);
end;

procedure TFMSEUR.DBEAcreedorChange(Sender: TObject);
begin
  inherited;
  ETituloAcreedor.Text := DameTituloAcreedor(StrToIntDef(DBEAcreedor.Text, 0));
end;

procedure TFMSEUR.DBEAcreedorDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AAcreedores, 'ACREEDOR=' + DBEAcreedor.Text);
end;

procedure TFMSEUR.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMSEUR.BPruebasAPIClick(Sender: TObject);
var
  Cities : TStrings;
  shipmentCode : string;
  Ficheros : TStrings;
  i : integer;
begin
  inherited;
  try
     DMSEUR.WS_Inicializa(StrToIntDef(DBEAcreedor.Text, 0), True);

     Cities := TStringList.Create;
     try
        DMSEUR.GetCities('ES', '01117', Cities);
        DMMain.Log(format('GetCities( %s, %s )' + #13#10 + '%s', ['ES', '01117', Cities.Text]));

        DMSEUR.GetCities('ES', '08035', Cities);
        DMMain.Log(format('GetCities( %s, %s )' + #13#10 + '%s', ['ES', '08035', Cities.Text]));

        DMSEUR.GetCities('FR', '75000', Cities);
        DMMain.Log(format('GetCities( %s, %s )' + #13#10 + '%s', ['FR', '75000', Cities.Text]));

        DMSEUR.GetCities('ZZ', '12345', Cities);
        DMMain.Log(format('GetCities( %s, %s )' + #13#10 + '%s', ['ZZ', '12345', Cities.Text]));
     finally
        Cities.Free;
     end;
  except
  end;

  // Internacional (77, 104)
  // Nacional (31, 2)
  DMSEUR.NuevoEnvio(77, 104, 'Refrencia', 'Observaciones', 'Segunda Referencia');
  DMSEUR.Receiver('Nombre', 'Telefono', 'Nombre contacto', 'email', 'Calle', 'Codigo Postal', 'Pais', 'Ciudad');
  DMSEUR.NuevoPaquete(1.1, 'Referncia Paquete 1');
  DMSEUR.NuevoPaquete(1.2, 'Referncia Paquete 2');
  DMSEUR.NuevoPaquete(1.3, 'Referncia Paquete 3');
  if DMSEUR.Enviar(shipmentCode) = 200 then
  begin
     DMMain.Log('shipmentCode: ' + shipmentCode);
     Ficheros := TStringList.Create;
     try
        shipmentCode := '028388406528420250826';
        // Label Nacional
        DMSEUR.GetLabel(shipmentCode, 'CUSTOM_REFERENCE', 'PDF', 'SHIPMENTS', Ficheros);
        // Label Internacional
        DMSEUR.GetLabel(shipmentCode, 'GEOLABEL', 'PDF', 'SHIPMENTS', Ficheros);
        for i := 0 to Ficheros.Count - 1 do
           DMMain.Log('Etiqueta: ' + Ficheros[i]);
     finally
        Ficheros.Free;
     end;
  end;
end;

procedure TFMSEUR.FormShow(Sender: TObject);
begin
  inherited;
  {$IFNDEF Debug}
  BPruebasAPI.Visible := False;
  DBEAcessToken.Visible := False;
  {$ENDIF}
  ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(LeeDatoIni('SEUR', 'RutaCopiaEtiqueta', GetSpecialFolderPath(CSIDL_PERSONAL, True)));
end;

procedure TFMSEUR.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button in [nbPost] then
  begin
     ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(ERutaCopiaEtiqueta.Text);
     EscribeDatoIni('SEUR', 'RutaCopiaEtiqueta', ERutaCopiaEtiqueta.Text);
  end
  else
  begin
     ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(LeeDatoIni('SEUR', 'RutaCopiaEtiqueta', GetSpecialFolderPath(CSIDL_PERSONAL, True)));
  end;
end;

procedure TFMSEUR.SBDirectorioCopiaEtiquetaClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;
  Directorio := ExcludeTrailingPathDelimiter(ERutaCopiaEtiqueta.Text);
  if MySelectDirectory(Directorio, 'FMSEUR-DirCopiaEtiqueta') then
     ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(Directorio);
end;

end.
