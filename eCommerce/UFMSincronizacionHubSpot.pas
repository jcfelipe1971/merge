unit UFMSincronizacionHubSpot;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, ULFPageControl, StdCtrls,
  ULFEdit, ULFLabel, UNavigator, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, ULFDBEdit;

type
  TFMSincronizacionHubSpot = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSConfiguracion: TTabSheet;
     LURL: TLFLabel;
     EURL: TLFEdit;
     TSCompaniesContacts: TTabSheet;
     TSDeals: TTabSheet;
     DBGCompanies: TDBGridFind2000;
     TBCompanies: TLFToolBar;
     NavCompanies: THYMNavigator;
     TBSep1: TToolButton;
     PNLCompanies: TLFPanel;
     PNLContacts: TLFPanel;
     DBGContacts: TDBGridFind2000;
     TBContacts: TLFToolBar;
     NavCompanies1: THYMNavigator;
     TBSep2: TToolButton;
     PNLDeals: TLFPanel;
     DBGDeal: TDBGridFind2000;
     TBDeals: TLFToolBar;
     NavDeals: THYMNavigator;
     TB3: TToolButton;
     LToken: TLFLabel;
     DBEToken: TLFDbedit;
     TBEnviarCompaniesContactos: TToolButton;
     TBEnviarDeals: TToolButton;
     DBEURL: TLFDbedit;
     TBConfiguracion: TLFToolBar;
     NavConfiguracion: THYMNavigator;
     TBSep3: TToolButton;
     PNLConfiguracion: TLFPanel;
     splCompanies: TSplitter;
     PNLDealsDatos: TLFPanel;
     splDeals: TSplitter;
     LDealsDatosCompany: TLFLabel;
     DBEDealsDatosName: TLFDbedit;
     LDealsDatosCIF: TLFLabel;
     DBEDealsDatosCIF: TLFDbedit;
     LDealsDatosLastName: TLFLabel;
     DBEDealsDatosLastName: TLFDbedit;
     DBEDealsDatosFirstName: TLFDbedit;
     LDealsDatosFirstName: TLFLabel;
     LDealsDatosPhone: TLFLabel;
     DBEDealsDatosPhone: TLFDbedit;
     DBEDealsDatosEmail: TLFDbedit;
     LDealsDatosEmail: TLFLabel;
     TBSep4: TToolButton;
     TBRefrescarCompaniesContactos: TToolButton;
     TBSep5: TToolButton;
     TBRefrescarDeals: TToolButton;
     TBSep6: TToolButton;
     TBCrearCliente: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBEnviarCompaniesContactosClick(Sender: TObject);
     procedure TBEnviarDealsClick(Sender: TObject);
     procedure DBGCompaniesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGContactsDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGDealDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGCompaniesCellClick(Column: TColumn);
     procedure DBGContactsCellClick(Column: TColumn);
     procedure DBGDealCellClick(Column: TColumn);
     procedure DBGCompaniesDblClick(Sender: TObject);
     procedure DBGDealDblClick(Sender: TObject);
     procedure splCompaniesMoved(Sender: TObject);
     procedure PCMainResize(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure splDealsMoved(Sender: TObject);
     procedure TBRefrescarCompaniesContactosClick(Sender: TObject);
     procedure TBRefrescarDealsClick(Sender: TObject);
     procedure TBCrearClienteClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     Top_splCompanies: integer;
     Width_splDeals: integer;
  public
     { Public declarations }
  end;

var
  FMSincronizacionHubSpot : TFMSincronizacionHubSpot;

implementation

uses UDMMain, UFormGest, UDMSincronizacionHubSpot, UParam, UEntorno, UUtiles,
  UFMain, DateUtils, UFMOfertas;

{$R *.dfm}

procedure TFMSincronizacionHubSpot.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSincronizacionHubSpot, DMSincronizacionHubSpot);
  ColActual := DBGCompanies.Columns[0];
  PCMain.ActivePage := TSCompaniesContacts;
end;

procedure TFMSincronizacionHubSpot.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  EscribeDatoIni('FMSincronizacionHubSpot', 'Top_splCompanies', Top_splCompanies);
  EscribeDatoIni('FMSincronizacionHubSpot', 'Width_splDeals', Width_splDeals);

  CierraData(DMSincronizacionHubSpot);
end;

procedure TFMSincronizacionHubSpot.FormShow(Sender: TObject);
begin
  inherited;
  Top_splCompanies := LeeDatoIni('FMSincronizacionHubSpot', 'Top_splCompanies', 0);
  if (Top_splCompanies = 0) then
     Top_splCompanies := Trunc(TSCompaniesContacts.Height / 4);
  PNLContacts.Height := Top_splCompanies;

  if Top_splCompanies > TSCompaniesContacts.Height - 150 then
  begin
     Top_splCompanies := TSCompaniesContacts.Height - 150;
     PNLContacts.Height := Top_splCompanies;
  end;

  Width_splDeals := LeeDatoIni('FMSincronizacionHubSpot', 'Width_splDeals', 0);
  if (Width_splDeals = 0) then
     Width_splDeals := 250;
  PNLDealsDatos.Width := Width_splDeals;

  if Width_splDeals > TSDeals.Width - 250 then
  begin
     Width_splDeals := TSDeals.Width - 250;
     PNLDealsDatos.Width := Width_splDeals;
  end;
end;

procedure TFMSincronizacionHubSpot.TBEnviarCompaniesContactosClick(Sender: TObject);
begin
  inherited;
  DMSincronizacionHubSpot.EnviarCompaniesContactos;
end;

procedure TFMSincronizacionHubSpot.TBEnviarDealsClick(Sender: TObject);
begin
  inherited;
  DMSincronizacionHubSpot.EnviarDeals;
end;

procedure TFMSincronizacionHubSpot.DBGCompaniesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if ((UpperCase(Column.FieldName) = 'DELFOS_COMPANY_ID') or (UpperCase(Column.FieldName) = 'ID_CLIENTE')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'HUBSPOT_COMPANY_ID') then
        begin
           if (DataSource.DataSet.FieldByName('HUBSPOT_COMPANY_ID').AsString = '') then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'DELFOS_COMPANY_ID') then
        begin
           if (DataSource.DataSet.FieldByName('DELFOS_COMPANY_ID').AsString = '') then
              ColorResaltado3(Canvas)
           else
              ColorNormal(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'RESULTADO_ENVIO') then
        begin
           if (DataSource.DataSet.FieldByName('RESULTADO_ENVIO').AsInteger >= 200) and (DataSource.DataSet.FieldByName('RESULTADO_ENVIO').AsInteger <= 299) then
              ColorResaltado2(Canvas)
           else
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'DATE_SINC') then
        begin
           if (SecondsBetween(DataSource.DataSet.FieldByName('DATE_UPD').AsDateTime, DataSource.DataSet.FieldByName('DATE_SINC').AsDateTime) > 60) then
              ColorError(Canvas)
           else
              ColorResaltado2(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionHubSpot.DBGContactsDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'HUBSPOT_COMPANY_ID') then
        begin
           if (DataSource.DataSet.FieldByName('HUBSPOT_COMPANY_ID').AsString = '') then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'HUBSPOT_CONTACT_ID') then
        begin
           if (DataSource.DataSet.FieldByName('HUBSPOT_CONTACT_ID').AsString = '') then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'DELFOS_COMPANY_ID') then
        begin
           if (DataSource.DataSet.FieldByName('DELFOS_COMPANY_ID').AsString = '') then
              ColorResaltado3(Canvas)
           else
              ColorNormal(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'DELFOS_CONTACT_ID') then
        begin
           if (DataSource.DataSet.FieldByName('DELFOS_CONTACT_ID').AsString = '') then
              ColorResaltado3(Canvas)
           else
              ColorNormal(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'RESULTADO_ENVIO') then
        begin
           if (DataSource.DataSet.FieldByName('RESULTADO_ENVIO').AsInteger >= 200) and (DataSource.DataSet.FieldByName('RESULTADO_ENVIO').AsInteger <= 299) then
              ColorResaltado2(Canvas)
           else
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'DATE_SINC') then
        begin
           if (SecondsBetween(DataSource.DataSet.FieldByName('DATE_UPD').AsDateTime, DataSource.DataSet.FieldByName('DATE_SINC').AsDateTime) > 60) then
              ColorError(Canvas)
           else
              ColorResaltado2(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionHubSpot.DBGDealDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if ((UpperCase(Column.FieldName) = 'DELFOS_DEAL_ID') or (UpperCase(Column.FieldName) = 'ID_S')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'HUBSPOT_DEAL_ID') then
        begin
           if (DataSource.DataSet.FieldByName('HUBSPOT_DEAL_ID').AsString = '') then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'DELFOS_DEAL_ID') then
        begin
           if (DataSource.DataSet.FieldByName('DELFOS_DEAL_ID').AsString = '') then
              ColorResaltado3(Canvas)
           else
              ColorNormal(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'HUBSPOT_COMPANY_ID') then
        begin
           if (DataSource.DataSet.FieldByName('HUBSPOT_COMPANY_ID').AsString = '') then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'HUBSPOT_CONTACT_ID') then
        begin
           if (DataSource.DataSet.FieldByName('HUBSPOT_CONTACT_ID').AsString = '') then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'DEAL_STATUS') then
        begin
           if (DataSource.DataSet.FieldByName('DEAL_STATUS').AsString = '') then
              ColorError(Canvas)
           else
           if (DataSource.DataSet.FieldByName('DEAL_STATUS').AsString = 'appointmentscheduled') then
              ColorResaltado(Canvas)
           else
           if (DataSource.DataSet.FieldByName('DEAL_STATUS').AsString = 'qualifiedtobuy') then
              ColorResaltado(Canvas)
           else
           if (DataSource.DataSet.FieldByName('DEAL_STATUS').AsString = 'presentationscheduled') then
              ColorResaltado(Canvas)
           else
           if (DataSource.DataSet.FieldByName('DEAL_STATUS').AsString = 'decisionmakerboughtin') then
              ColorResaltado(Canvas)
           else
           if (DataSource.DataSet.FieldByName('DEAL_STATUS').AsString = 'contractsent') then
              ColorResaltado(Canvas)
           else
           if (DataSource.DataSet.FieldByName('DEAL_STATUS').AsString = 'closedwon') then
              ColorResaltado2(Canvas)
           else
           if (DataSource.DataSet.FieldByName('DEAL_STATUS').AsString = 'closedlost') then
              ColorResaltado3(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'RESULTADO_ENVIO') then
        begin
           if (DataSource.DataSet.FieldByName('RESULTADO_ENVIO').AsInteger >= 200) and (DataSource.DataSet.FieldByName('RESULTADO_ENVIO').AsInteger <= 299) then
              ColorResaltado2(Canvas)
           else
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'DATE_SINC') then
        begin
           if (SecondsBetween(DataSource.DataSet.FieldByName('DATE_UPD').AsDateTime, DataSource.DataSet.FieldByName('DATE_SINC').AsDateTime) > 60) then
              ColorError(Canvas)
           else
              ColorResaltado2(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionHubSpot.DBGCompaniesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMSincronizacionHubSpot.DBGContactsCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMSincronizacionHubSpot.DBGDealCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMSincronizacionHubSpot.DBGCompaniesDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'DELFOS_COMPANY_ID') or (UpperCase(ColActual.FieldName) = 'ID_CLIENTE') then
     FMain.EjecutaAccion(FMain.AClientes, 'ID_CLIENTE = ' + IntToStr(DMSincronizacionHubSpot.xCompaniesID_CLIENTE.AsInteger));
end;

procedure TFMSincronizacionHubSpot.DBGDealDblClick(Sender: TObject);
var
  IdDoc : integer;
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'DELFOS_DEAL_ID') or (UpperCase(ColActual.FieldName) = 'ID_S') then
     FMain.TraspasoDeDocumentosSalida(DMSincronizacionHubSpot.xDealsID_S.AsInteger)
  else
  begin
     FMain.EjecutaAccion(FMain.AOfertas);
     IdDoc := FMOfertas.CreaOfertaHubspot(DMSincronizacionHubSpot.DameCliente(DMSincronizacionHubSpot.xDealsHUBSPOT_COMPANY_ID.AsString), REntorno.Serie);

     DMSincronizacionHubSpot.xDeals.Edit;
     DMSincronizacionHubSpot.xDealsID_S.AsInteger := IdDoc;
     DMSincronizacionHubSpot.xDealsDELFOS_DEAL_ID.AsString := IntToStr(IdDoc);
     DMSincronizacionHubSpot.xDeals.Post;

     FMain.TraspasoDeDocumentosSalida(IdDoc);
  end;
end;

procedure TFMSincronizacionHubSpot.splCompaniesMoved(Sender: TObject);
begin
  inherited;
  Top_splCompanies := PNLContacts.Height;
end;

procedure TFMSincronizacionHubSpot.PCMainResize(Sender: TObject);
begin
  inherited;
  // Por lo menos el panel de contactos debe ser de 100px
  if PNLCompanies.Height < 150 then
  begin
     Top_splCompanies := TSCompaniesContacts.Height - 150;
     PNLContacts.Height := Top_splCompanies;
  end;

  // Por lo menos el panel de datos de deal debe ser de 250px
  if DBGDeal.Width < 250 then
  begin
     Width_splDeals := TSDeals.Width - 250;
     PNLDealsDatos.Width := Width_splDeals;
  end;
end;

procedure TFMSincronizacionHubSpot.splDealsMoved(Sender: TObject);
begin
  inherited;
  Width_splDeals := PNLDealsDatos.Width;
end;

procedure TFMSincronizacionHubSpot.TBRefrescarCompaniesContactosClick(Sender: TObject);
begin
  inherited;
  DMSincronizacionHubSpot.RefresarCompaniesContactos;
end;

procedure TFMSincronizacionHubSpot.TBRefrescarDealsClick(Sender: TObject);
begin
  inherited;
  DMSincronizacionHubSpot.RefrescarDeals;
end;

procedure TFMSincronizacionHubSpot.TBCrearClienteClick(Sender: TObject);
begin
  inherited;
  DMSincronizacionHubSpot.CrearCliente;
end;

end.
