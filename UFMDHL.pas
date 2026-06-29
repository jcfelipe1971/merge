unit UFMDHL;

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
  TFMDHL = class(TFPEdit)
     LAcreedor: TLFLabel;
     LCloseTime: TLFLabel;
     LPickupLocation: TLFLabel;
     LPickupLocationType: TLFLabel;
     LSpecialInstructionsValue: TLFLabel;
     LRemark: TLFLabel;
     DBECloseTime: TLFDbedit;
     DBEPickupLocation: TLFDbedit;
     DBESpecialInstructionsValue: TLFDbedit;
     DBERemark: TLFDbedit;
     ETituloAcreedor: TLFEdit;
     DBEAcreedor: TDBEditFind2000;
     LConfiguracionAPI: TLFLabel;
     LConfiguracionShipper: TLFLabel;
     LContactCompayName: TLFLabel;
     DBEContactCompayName: TLFDbedit;
     LContactPhone: TLFLabel;
     DBEContactPhone: TLFDbedit;
     LAddress1: TLFLabel;
     DBEAddress1: TLFDbedit;
     LPostCode: TLFLabel;
     DBEPostCode: TLFDbedit;
     LCountry: TLFLabel;
     DBECountry: TLFDbedit;
     LCity: TLFLabel;
     DBECity: TLFDbedit;
     LConfiguracionOtros: TLFLabel;
     BPruebasAPI: TButton;
     LWSURL: TLFLabel;
     LunitOfMeasurement: TLFLabel;
     SBDirectorioCopiaEtiqueta: TSpeedButton;
     LGestion: TLFLabel;
     LProvincia: TLFLabel;
     DBEProvincia: TLFDbedit;
     LAddress2: TLFLabel;
     DBEAddress2: TLFDbedit;
     LAddres3: TLFLabel;
     DBEAddress3: TLFDbedit;
     LCountyName: TLFLabel;
     DBECountyName: TLFDbedit;
     LDBEContactEmail: TLFLabel;
     DBEContactEmail: TLFDbedit;
     LContactMobilePhone: TLFLabel;
     DBEContactMobilePhone: TLFDbedit;
     LContactFullName: TLFLabel;
     DBEContactFullName: TLFDbedit;
     LConfigPickupDetails: TLFLabel;
     LPUContactCompayName: TLFLabel;
     LPUContactPhone: TLFLabel;
     LPUAddress1: TLFLabel;
     LPUPostCode: TLFLabel;
     LPUCountry: TLFLabel;
     LPUCity: TLFLabel;
     DBEPUContactCompayName: TLFDbedit;
     DBEPUContactPhone: TLFDbedit;
     DBEPUAddress1: TLFDbedit;
     DBEPUPostCode: TLFDbedit;
     DBEPUCountry: TLFDbedit;
     DBEPUCity: TLFDbedit;
     LPUProvincia: TLFLabel;
     DBEPUProvincia: TLFDbedit;
     LPUAddress2: TLFLabel;
     DBEPUAddress2: TLFDbedit;
     LPUAddress3: TLFLabel;
     DBEPUAddress3: TLFDbedit;
     LPUCountyName: TLFLabel;
     DBEPUCountyName: TLFDbedit;
     LPUContactEmail: TLFLabel;
     DBEPUContactEmail: TLFDbedit;
     LPUContactMobilePhone: TLFLabel;
     DBEPUContactMobilePhone: TLFDbedit;
     LPUContactFullName: TLFLabel;
     DBEPUContactFullName: TLFDbedit;
     LAccountNumber: TLFLabel;
     DBEAccountNumber: TLFDbedit;
     LAccountTypeCode: TLFLabel;
     DBCBPickupLocationType: TDBComboBox;
     DBCBAccountTypeCode: TDBComboBox;
     LSpecialInstructionsType: TLFLabel;
     DBCBSpecialInstructionsType: TDBComboBox;
     DBCBunitOfMeasurement: TDBComboBox;
     LRutaCopiaEtiqueta: TLFLabel;
     ERutaCopiaEtiqueta: TLFEdit;
     DBCBWSURL: TDBComboBox;
     LUsername: TLFLabel;
     DBEWSUserName: TLFDbedit;
     LWSPassword: TLFLabel;
     DBEWSPassword: TLFDbedit;
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
  FMDHL : TFMDHL;

implementation

uses UDMDHL, UEntorno, UDMMain, UFormGest, UFMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMDHL.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMDHL, DMDHL);
  NavMain.DataSource := DMDHL.DSxDHLTransportista;
  DBGMain.DataSource := DMDHL.DSxDHLTransportista;
  G2kTableLoc.DataSource := DMDHL.DSxDHLTransportista;

  GetBitmapFromImageList(SBDirectorioCopiaEtiqueta, 1, DMMain.ILMain_Ac, 65);
  ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(LeeDatoIni('DHL', 'RutaCopiaEtiqueta', GetSpecialFolderPath(CSIDL_PERSONAL, True)));
end;

procedure TFMDHL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDHL);
end;

procedure TFMDHL.DBEAcreedorChange(Sender: TObject);
begin
  inherited;
  ETituloAcreedor.Text := DameTituloAcreedor(StrToIntDef(DBEAcreedor.Text, 0));
end;

procedure TFMDHL.DBEAcreedorDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AAcreedores, 'ACREEDOR=' + DBEAcreedor.Text);
end;

procedure TFMDHL.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMDHL.BPruebasAPIClick(Sender: TObject);
//var
//Cities : TStrings;
//shipmentCode : string;
//Ficheros : TStrings;
//i : integer;
begin
  inherited;
  (*
  try
     DMDHL.WS_Inicializa(StrToIntDef(DBEAcreedor.Text, 0), True);

     Cities := TStringList.Create;
     try
        DMDHL.GetCities('ES', '01117', Cities);
        DMMain.Log(format('GetCities( %s, %s )' + #13#10 + '%s', ['ES', '01117', Cities.Text]));

        DMDHL.GetCities('ES', '08035', Cities);
        DMMain.Log(format('GetCities( %s, %s )' + #13#10 + '%s', ['ES', '08035', Cities.Text]));

        DMDHL.GetCities('FR', '75000', Cities);
        DMMain.Log(format('GetCities( %s, %s )' + #13#10 + '%s', ['FR', '75000', Cities.Text]));

        DMDHL.GetCities('ZZ', '12345', Cities);
        DMMain.Log(format('GetCities( %s, %s )' + #13#10 + '%s', ['ZZ', '12345', Cities.Text]));
     finally
        Cities.Free;
     end;
  except
  end;
  *)

  DMDHL.NuevoEnvio('P', 'P', False, '123456');

  DMDHL.NuevoValueAddedServices('II', 10, 'USD');

  DMDHL.customerDetails_shipperDetails('526238', 'Zhaoqing', 'CN', '', '4FENQU, 2HAOKU, WEIPINHUI WULIU YUAN, DAWANG', 'GAOXIN QU, BEIJIANG DADAO, SIHUI,', 'ZHAOQING, GUANDONG', 'SIHUI', '', 'CHINA, PEOPLES REPUBLIC',
     'shipper_create_shipmentapi@dhltestmail.com', '18211309039', '18211309039', 'Cider BookStore', 'LiuWeiMing',
     'SDT', 'CN123456789', 'CN',
     'Bank of China', 'RMB', 'USD', 'business');

  DMDHL.customerDetails_receiverDetails('76449', 'Graford', 'US', '', '116 Marine Dr', '', '', '', '', 'UNITED STATES OF AMERICA',
     'recipient_create_shipmentapi@dhltestmail.com', '9402825665', '9402825666', 'Baylee Marshall', 'Baylee Marshall',
     'SSN', 'US123456789', 'US',
     'Bank of America', 'USD', 'USD', 'business');

  DMDHL.Contenido(True, 120, 'USD', 'Shipment', '12345', 'DAP', 'metric');
  DMDHL.NuevoPaquete('2BP', 0.5, 1, 1, 1, '3654673', 'CU', 'Piece content description', 'bespoke label description');

  DMDHL.NuevoexportDeclarationlineItems(1, 'Harry Steward biography first edition', 15, 4, 'GM',
     'outbound', '84713000', 'inbound', '5109101110', 'permanent', 'US', 'US123456789',
     0.1, 0.7, True, '450pages',
     'AFE', '1299210', '', '', 'COO', 'MyDHLAPI - LN#1-CUSDOC-001');
  DMDHL.NuevoexportDeclarationlineItems(2, 'Andromeda Chapter 394 - Revenge of Brook', 15, 4, 'GM',
     'outbound', '6109100011', 'inbound', '5109101111', 'permanent', 'US', 'US123456789',
     0.1, 0.7, True, '36pages',
     'AFE', '1299211', '', '', 'COO', 'MyDHLAPI - LN#1-CUSDOC-001');

  DMDHL.exportDeclarationInvoice('2667168671', EncodeDate(2022, 10, 22), 'Handle with care', 0.4, 0.5, '100 days', 150.57, 49.43,
     'UCN', 'UCN-783974937',
     'CN', 'CUN-76498376498',
     'RMA', 'MyDHLAPI-TESTREF-001');

  DMDHL.NuevoexportDeclarationRemarks('Right side up only');
  DMDHL.NuevoexportDeclarationAdditionalCharges(10, 'fee', 'freight');
  DMDHL.NuevoexportDeclarationAdditionalCharges(20, 'freight charges', 'other');
  DMDHL.NuevoexportDeclarationAdditionalCharges(10, 'ins charges', 'insurance');
  DMDHL.NuevoexportDeclarationAdditionalCharges(7, 'rev charges', 'reverse_charge');
  DMDHL.exportDeclarationline('New York Port', 'ShenZhen Port', '12345ED', '01291344', '121233', 'S', 'Fragile glass bottle',
     'up to three declaration notes', 'export reference', 'export reason', 'permanent', 'export', '123127233', 'personal', 'INV', 'MyDHLAPI - CUSDOC-001');

  DMDHL.NuevoshipmentNotification('email', 'shipmentnotification@mydhlapisample.com', 'eng', 'UK', 'message to be included in the notification');

  DMDHL.getTransliteratedResponse(False);
  DMDHL.estimatedDeliveryDate(True, 'QDDC');
  DMDHL.NuevogetAdditionalInformation(True, 'pickupDetails');

  DMDHL.GuardarFicheroEnvio(IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True)) + 'Envio-DHL.json');

  {
  if DMDHL.Enviar(shipmentCode) = 200 then
  begin
     DMMain.Log('shipmentCode: ' + shipmentCode);
     Ficheros := TStringList.Create;
     try
        shipmentCode := '028388406528420250826';
        // Label Nacional
        DMDHL.GetLabel(shipmentCode, 'CUSTOM_REFERENCE', 'PDF', 'SHIPMENTS', Ficheros);
        // Label Internacional
        DMDHL.GetLabel(shipmentCode, 'GEOLABEL', 'PDF', 'SHIPMENTS', Ficheros);
        for i := 0 to Ficheros.Count - 1 do
           DMMain.Log('Etiqueta: ' + Ficheros[i]);
     finally
        Ficheros.Free;
     end;
  end;
  }
end;

procedure TFMDHL.FormShow(Sender: TObject);
begin
  inherited;
  {$IFNDEF Debug}
  BPruebasAPI.Visible := False;
  {$ENDIF}
  ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(LeeDatoIni('DHL', 'RutaCopiaEtiqueta', GetSpecialFolderPath(CSIDL_PERSONAL, True)));
end;

procedure TFMDHL.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button in [nbPost] then
  begin
     ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(ERutaCopiaEtiqueta.Text);
     EscribeDatoIni('DHL', 'RutaCopiaEtiqueta', ERutaCopiaEtiqueta.Text);
  end
  else
  begin
     ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(LeeDatoIni('DHL', 'RutaCopiaEtiqueta', GetSpecialFolderPath(CSIDL_PERSONAL, True)));
  end;
end;

procedure TFMDHL.SBDirectorioCopiaEtiquetaClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;
  Directorio := ExcludeTrailingPathDelimiter(ERutaCopiaEtiqueta.Text);
  if MySelectDirectory(Directorio, 'FMDHL-DirCopiaEtiqueta') then
     ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(Directorio);
end;

end.
