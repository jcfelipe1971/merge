unit UFMParamModelosHacienda;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  UG2kTBLoc, ULFPageControl, ULFPanel, ULFLabel, ULFDBEdit,
  ULFDBEditFind2000, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFEdit,
  Buttons;

type
  TFMParamModelosHacienda = class(TFPEdit)
     GBDeclarante: TGroupBox;
     LFLNIF: TLFLabel;
     DBENIF: TLFDBEdit;
     LFLNombre: TLFLabel;
     DBENombre: TLFDBEdit;
     DBETipoCalle: TLFDBEdit;
     LFLTipoCalle: TLFLabel;
     LFLNumero: TLFLabel;
     DBENumero: TLFDBEdit;
     DBECodPostal: TLFDBEdit;
     LFLCodPostal: TLFLabel;
     LFLTelefono: TLFLabel;
     DBETelefono: TLFDBEdit;
     DBEMunicipio: TLFDBEdit;
     LFLProvincia: TLFLabel;
     DBEProvincia: TLFDBEdit;
     LFLMunicipio: TLFLabel;
     LFLEscalera: TLFLabel;
     DBEEscalera: TLFDBEdit;
     DBECalle: TLFDBEdit;
     LFLCalle: TLFLabel;
     LFLPiso: TLFLabel;
     DBEPiso: TLFDBEdit;
     LFLPuerta: TLFLabel;
     DBEPuerta: TLFDBEdit;
     GBDelegacion: TGroupBox;
     LFLDelegacion: TLFLabel;
     DBEDelegacion: TLFDBEdit;
     DBEAdministracion: TLFDBEdit;
     LFLAdministracion: TLFLabel;
     LFLCodAdmin: TLFLabel;
     DBECodAdmin: TLFDBEdit;
     GBPresentador: TGroupBox;
     LFLNIFP: TLFLabel;
     LFLNombreP: TLFLabel;
     LFLTipoCalleP: TLFLabel;
     LFLNumeroP: TLFLabel;
     LFLCodPostalP: TLFLabel;
     LFLTelefonoP: TLFLabel;
     LFLProvinciaP: TLFLabel;
     LFLMunicipioP: TLFLabel;
     LFLEscaleraP: TLFLabel;
     LFLCalleP: TLFLabel;
     LFLPisoP: TLFLabel;
     LFLPuertaP: TLFLabel;
     DBENIFP: TLFDBEdit;
     DBENombreP: TLFDBEdit;
     DBETipoCalleP: TLFDBEdit;
     DBENumeroP: TLFDBEdit;
     DBECodPostalP: TLFDBEdit;
     DBETelefonoP: TLFDBEdit;
     DBEMunicipioP: TLFDBEdit;
     DBEProvinciaP: TLFDBEdit;
     DBEEscaleraP: TLFDBEdit;
     DBECalleP: TLFDBEdit;
     DBEPisoP: TLFDBEdit;
     DBEPuertaP: TLFDBEdit;
     GBModelos: TGroupBox;
     LFDBCBModelo300: TLFDBCheckBox;
     LFDBCBModelo115: TLFDBCheckBox;
     LFDBCBModelo110: TLFDBCheckBox;
     LFLIBAN: TLFLabel;
     DBEIBAN: TLFDbedit;
     DBEBIC: TLFDbedit;
     LFLBIC: TLFLabel;
     LFLEntidad: TLFLabel;
     DBEEntidad: TLFDBEdit;
     DBESucursal: TLFDBEdit;
     DBEDC: TLFDBEdit;
     DBECuenta: TLFDBEdit;
     CB303Mensual: TLFDBCheckBox;
     CB349Mensual: TLFDBCheckBox;
     GBCertificado: TGroupBox;
     LCertificado: TLFLabel;
     DBECertificado: TLFDbedit;
     CBSIIPruebas: TLFCheckBox;
     CBTBAIPruebas: TLFCheckBox;
     LTBAIDispositivo: TLFLabel;
     ETBAIDispositivo: TLFEdit;
     LTBAILicencia: TLFLabel;
     ETBAILicencia: TLFEdit;
     LCertificadoLROE: TLFLabel;
     DBECertificadoLROE: TLFDbedit;
     DBECertificadoLROEClave: TLFDbedit;
     LCertificadoLROEClave: TLFLabel;
     SBCertificadoLROE: TSpeedButton;
     CB592Mensual: TLFDBCheckBox;
     DBCBUtilizaSII: TLFDBCheckBox;
     DBCBUtilizaTicketBAI: TLFDBCheckBox;
     DBCBUtilizaVerifactu: TLFDBCheckBox;
     DBCBVerifactuPruebas: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure CBSIIPruebasChange(Sender: TObject);
     procedure CBSIIPruebasClick(Sender: TObject);
     procedure CBTBAIPruebasChange(Sender: TObject);
     procedure SBCertificadoLROEClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBCBUtilizaSIIChange(Sender: TObject);
     procedure DBCBUtilizaTicketBAIChange(Sender: TObject);
     procedure DBCBUtilizaVerifactuChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMParamModelosHacienda : TFMParamModelosHacienda;

implementation

uses UDMParamModelosHacienda, UFormGest, UDMMain, HYFIBQuery, UUtiles;

{$R *.DFM}

procedure TFMParamModelosHacienda.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMParamModelosHacienda, DMParamModelosHacienda);
  DBGMain.DataSource := DMParamModelosHacienda.DSQMModelos;
  NavMain.DataSource := DMParamModelosHacienda.DSQMModelos;
  NavMain.EditaControl := DBEDelegacion;

  GetBitmapFromImageList(SBCertificadoLROE, 1, DMMain.ILMain_Ac, 65);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT URL FROM SII_URL_ENDPOINT WHERE TIPO = ''EMI'' ';
        ExecQuery;
        CBSIIPruebas.Checked := (FieldByName['URL'].AsString = 'https://www7.aeat.es/wlpl/SSII-FACT/ws/fe/SiiFactFEV1SOAP');
        FreeHandle;
     finally
        Free;
     end;
  end;

  CBSIIPruebasChange(nil);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT URL FROM SII_URL_ENDPOINT WHERE TIPO = ''TBA'' ';
        ExecQuery;
        CBTBAIPruebas.Checked := (FieldByName['URL'].AsString = 'https://tbai-prep.egoitza.gipuzkoa.eus/WAS/HACI/HTBRecepcionFacturasWEB/rest/recepcionFacturas/alta');
        FreeHandle;
     finally
        Free;
     end;
  end;

  ETBAIDispositivo.Text := LeeDatoIni('TBAI', 'Dispositivo', 'PRUEBA');
  ETBAILicencia.Text := LeeDatoIni('TBAI', 'Licencia', 'TBAIBI00000000PRUEBA');
  CBTBAIPruebasChange(nil);

  DBCBUtilizaSIIChange(nil);
  DBCBUtilizaTicketBAIChange(nil);
  DBCBUtilizaVerifactuChange(nil);
end;

procedure TFMParamModelosHacienda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMParamModelosHacienda);
end;

procedure TFMParamModelosHacienda.FormShow(Sender: TObject);
begin
  inherited;
  if Assigned(TSTabla) then
     TSTabla.TabVisible := False;
end;

procedure TFMParamModelosHacienda.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  if Assigned(TSTabla) then
     TSTabla.TabVisible := False;
  EscribeDatoIni('TBAI', 'Dispositivo', Trim(ETBAIDispositivo.Text));
  EscribeDatoIni('TBAI', 'Licencia', ETBAILicencia.Text);
  if (ETBAILicencia.Text = 'TBAIBI00000000PRUEBA') then
  begin
     {
     Datos del interesado para el modelo 140:
        NIF: 99980279S
        Nombre y apellidos: mhvzm4QckT xeKx2GpuZR mSK25bEgBH

     Datos del interesado para el modelo 240:
        NIF: A99802803
        Razón social: mP2FfKjA6YACvZu2mS2FwA4zVqtpcr
     }
     EscribeDatoIni('TBAI', 'NIF', 'A99802803');
     EscribeDatoIni('TBAI', 'Nombre', 'mP2FfKjA6YACvZu2mS2FwA4zVqtpcr');
     EscribeDatoIni('TBAI', 'Version', '1.0');
  end
  else
  begin
     EscribeDatoIni('TBAI', 'NIF', DBENIF.Text);
     EscribeDatoIni('TBAI', 'Nombre', DBENombre.Text);
     EscribeDatoIni('TBAI', 'Version', '1.0');
  end;

  DMParamModelosHacienda.TBAIPruebas(CBTBAIPruebas.Checked);
end;

procedure TFMParamModelosHacienda.CBSIIPruebasChange(Sender: TObject);
begin
  inherited;
  with CBSIIPruebas do
  begin
     if (Checked) then
     begin
        Color := clRed;
        Font.Color := clWhite;
     end
     else
     begin
        Color := clBtnFace;
        Font.Color := clWindowText;
     end;
  end;
end;

procedure TFMParamModelosHacienda.CBSIIPruebasClick(Sender: TObject);
begin
  inherited;
  DMParamModelosHacienda.SIIPruebas(CBSIIPruebas.Checked);
end;

procedure TFMParamModelosHacienda.CBTBAIPruebasChange(Sender: TObject);
begin
  inherited;
  with CBTBAIPruebas do
  begin
     if (Checked) then
     begin
        Color := clRed;
        Font.Color := clWhite;
        ETBAILicencia.Text := 'TBAIBI00000000PRUEBA';
     end
     else
     begin
        Color := clBtnFace;
        Font.Color := clWindowText;
        ETBAILicencia.Text := 'TBAIBInGhsoTCMFYxiI5';
     end;
  end;
end;

procedure TFMParamModelosHacienda.SBCertificadoLROEClick(Sender: TObject);
begin
  inherited;
  with TOpenDialog.Create(nil) do
  begin
     try
        Filter := _('Certificados|*.p12|Todos los archivos|*.*');
        FilterIndex := 1;
        // Posicion inicial en Mis Documentos
        InitialDir := GetSpecialFolderPath(CSIDL_PERSONAL, False);
        Title := _('Carga de Certificado');
        if (Execute) then
           DMParamModelosHacienda.QMModelosCERTIFICADO_LROE_FICHERO.AsString := FileName;
     finally
        Free;
     end;
  end;
end;

procedure TFMParamModelosHacienda.DBCBUtilizaSIIChange(Sender: TObject);
begin
  inherited;
  CBSIIPruebas.Visible := DBCBUtilizaSII.Checked;
end;

procedure TFMParamModelosHacienda.DBCBUtilizaTicketBAIChange(Sender: TObject);
begin
  inherited;
  CBTBAIPruebas.Visible := DBCBUtilizaTicketBAI.Checked;
  LTBAIDispositivo.Visible := DBCBUtilizaTicketBAI.Checked;
  ETBAIDispositivo.Visible := DBCBUtilizaTicketBAI.Checked;
  LTBAILicencia.Visible := DBCBUtilizaTicketBAI.Checked;
  ETBAILicencia.Visible := DBCBUtilizaTicketBAI.Checked;
end;

procedure TFMParamModelosHacienda.DBCBUtilizaVerifactuChange(Sender: TObject);
begin
  inherited;
  DBCBVerifactuPruebas.Visible := DBCBUtilizaVerifactu.Checked;
end;

end.
