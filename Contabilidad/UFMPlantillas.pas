unit UFMPlantillas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, DBCtrls, StdCtrls, Mask,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, URecursos, ULFLabel, ULFEdit,
  UG2kTBLoc, HYFIBQuery;

type
  TFMPlantillas = class(TFPEdit)
     LPlantilla: TLFLabel;
     LTipo: TLFLabel;
     LMoneda: TLFLabel;
     LTitulo: TLFLabel;
     DBEPlantilla: TLFDbedit;
     DBENombre: TLFDbedit;
     DBETitTipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBETitMoneda: TLFDbedit;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBEFTipo: TLFDBEditFind2000;
     DBEFMoneda: TLFDBEditFind2000;
     PEdDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     LBancoKri: TLFLabel;
     DBEFBancoKri: TLFDBEditFind2000;
     LConceptoComunKri: TLFLabel;
     LCOnceptoPropioKri: TLFLabel;
     EBanco: TLFEdit;
     DBEConceptoComunKri: TLFDBEditFind2000;
     DBEConceptoPropioKri: TLFDBEditFind2000;
     ACentroCoste: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
     procedure DBEFTipoBusqueda(Sender: TObject);
     procedure DBEFBancoKriChange(Sender: TObject);
     procedure DBEConceptoComunKriBusqueda(Sender: TObject);
     procedure DBEConceptoPropioKriBusqueda(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure ACentroCosteExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPlantillas : TFMPlantillas;

implementation

uses UFormGest, UDMPlantillas, UDMMain, UUtiles, UFMain, UEntorno, UFMDigitosCoste, UParam, UDameDato;

{$R *.DFM}

// Nou
procedure TFMPlantillas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPlantillas, DMPlantillas);

  //Conectamos los datasources
  NavMain.DataSource := DMPlantillas.DSQMPlantillas;
  DBGMain.DataSource := DMPlantillas.DSQMPlantillas;
  NavDetalle.DataSource := DMPlantillas.DSQMDetalle;
  DBGFDetalle.DataSource := DMPlantillas.DSQMDetalle;
  G2KTableLoc.DataSource := DMPlantillas.DSQMPlantillas;
  if (LeeParametro('MODNORMA43') <> 'S') then
  begin
     LBancoKri.Visible := False;
     DBEFBancoKri.Visible := False;
     EBanco.Visible := False;
     LConceptoComunKri.Visible := False;
     DBEConceptoComunKri.Visible := False;
     LCOnceptoPropioKri.Visible := False;
     DBEConceptoPropioKri.Visible := False;
     PMain.Height := 129;
  end;
end;

procedure TFMPlantillas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPlantillas);
end;

procedure TFMPlantillas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  if ((DBEFTipo.Text = 'AFA') or
     (DBEFTipo.Text = 'AFC') or
     (DBEFTipo.Text = 'AFP') or
     (DBEFTipo.Text = 'EXT')) then
  begin
     NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
        nbDelete, nbPost, nbCancel, nbRefresh];
     NavDetalle.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
        nbPost, nbCancel, nbRefresh];
  end
  else
  begin
     NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
        nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
     NavDetalle.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
        nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
  end;

  DMPlantillas.CambiaMascara;
end;

procedure TFMPlantillas.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMPlantillas.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMPlantillas.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDetalle;
  if (DBGFDetalle.SelectedField.FieldName = 'CARGO') or
     (DBGFDetalle.SelectedField.FieldName = 'ABONO') then
     FMain.AddComponentePunto(DBGFDetalle)
  else
     FMain.DelComponentePunto(DBGFDetalle);
end;

procedure TFMPlantillas.DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
begin
  inherited;
  if (DBGFDetalle.SelectedField.FieldName = 'CARGO') or
     (DBGFDetalle.SelectedField.FieldName = 'ABONO') then
  begin
     //Cuando se abandone la columna de cuenta (ya sea de cargo o abono) se
     //expandira la cuenta si esta tiene un punto
     DBGFDetalle.SelectedField.AsString :=
        ExpandirCadena(Trim(DBGFDetalle.SelectedField.AsString), REntorno.DigitosSub);
  end;
end;

procedure TFMPlantillas.DBEFTipoBusqueda(Sender: TObject);
begin
  inherited;
  DBEFTipo.CondicionBusqueda :=
     'VISIBLE = 1 AND TIPO NOT IN (''CRC'',''CPB'',''PRP'',''PRA'',''EXT'',''AFA'',''AFC'',''AFP'')';
end;

procedure TFMPlantillas.DBEFBancoKriChange(Sender: TObject);
begin
  inherited;
  EBanco.Text := DameTituloBanco(StrToIntDef(DBEFBancoKri.Text, 0)); {dji lrk kri}
end;

procedure TFMPlantillas.DBEConceptoComunKriBusqueda(Sender: TObject);
begin
  inherited;
  DBEConceptoComunKri.CondicionBusqueda := 'ENTIDAD=''0000'' AND CONCEPTO_PROPIO=-1';
end;

procedure TFMPlantillas.DBEConceptoPropioKriBusqueda(Sender: TObject);
begin
  inherited;
  DBEConceptoPropioKri.CondicionBusqueda := 'ENTIDAD=''' + DameEntidadBanco(StrToIntDef(DBEFBancoKri.Text, 0)) + ''' AND CONCEPTO_COMUN=' + IntToStr(StrToIntDef(DBEConceptoComunKri.Text, 0));
end;

procedure TFMPlantillas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMPlantillas.ACentroCosteExecute(Sender: TObject);
// dji lrk kri Centros de Coste
var
  {d1, d2, d3, d4, d5 : string;}
  {estado : smallint;}
  {operacion : string;}
  Q : THYFIBQuery;
  ID : integer;
  Cuenta : string;
begin
  if ((DMPlantillas.TieneCentroCoste(DMPlantillas.QMDetalleCARGO.AsString)) or
     (DMPlantillas.TieneCentroCoste(DMPlantillas.QMDetalleABONO.AsString))) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
        SQL.Text := 'SELECT ID FROM tmp_traspasa_centro_coste (?empresa,?ejercicio,?canal,?serie,?tipo,?rig,?linea,?modo,?id_tmp)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := 'A'; {No se utiliza}
        Params.ByName['TIPO'].AsString := 'PLA';
        Params.ByName['RIG'].AsInteger := DMPlantillas.QMDetallePLANTILLA.AsInteger;
        Params.ByName['LINEA'].AsInteger := DMPlantillas.QMDetalleLINEA.AsInteger;
        Params.ByName['MODO'].AsInteger := 0;
        Params.ByName['ID_TMP'].AsInteger := 0;
        ExecQuery;
        id := FieldByName['ID'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);

     if ((DMPlantillas.QMDetalleCENTRO_COSTE.AsInteger = 1) and (DMPlantillas.TieneCentroCoste(DMPlantillas.QMDetalleCARGO.AsString))) then
        Cuenta := DMPlantillas.QMDetalleCARGO.AsString;
     if ((DMPlantillas.QMDetalleCENTRO_COSTE.AsInteger = 1) and (DMPlantillas.TieneCentroCoste(DMPlantillas.QMDetalleABONO.AsString))) then
        Cuenta := DMPlantillas.QMDetalleABONO.AsString;

     TFMDigitosCoste.Create(Self).Muestra(id, Cuenta);

     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
        SQL.Text := 'SELECT ID FROM tmp_traspasa_centro_coste (?empresa,?ejercicio,?canal,?serie,?tipo,?rig,?linea,?modo,?id_tmp)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := 'A'; {No se utiliza}
        Params.ByName['TIPO'].AsString := 'PLA';
        Params.ByName['RIG'].AsInteger := DMPlantillas.QMDetallePLANTILLA.AsInteger;
        Params.ByName['LINEA'].AsInteger := DMPlantillas.QMDetalleLINEA.AsInteger;
        Params.ByName['MODO'].AsInteger := 1;
        Params.ByName['ID_TMP'].AsInteger := id;
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

end.
