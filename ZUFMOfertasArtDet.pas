unit ZUFMOfertasArtDet;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, UNavigator, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, ULFToolBar, StdCtrls,
  ULFEdit, Mask, DBCtrls, ULFDBEdit, ULFLabel, UG2kTBLoc, ExtCtrls,
  ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, UHYDescription,
  ULFHYDBDescription, ULFDBEditFind2000, Menus, UTeclas, UControlEdit,
  UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  UEditPanel;

type
  TZFMOfertasArtDet = class(TFPEditSimple)
     G2KTableLoc: TG2KTBLoc;
     LblPCoste: TLFLabel;
     LblPVenta: TLFLabel;
     LblMargen: TLFLabel;
     LblCompuesto: TLFLabel;
     DBEPCoste: TLFDbedit;
     DBEPVenta: TLFDbedit;
     DBEMargen: TLFDbedit;
     ECompuesto: TLFEdit;
     EDescCompuesto: TLFEdit;
     PnlDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     DBGFDetalle: TDBGridFind2000;
     NavDetalle: THYMNavigator;
     LblLacado: TLFLabel;
     EFLacado: TLFDBEditFind2000;
     DescLacado: TLFHYDBDescription;
     DBChkBMotor: TLFDBCheckBox;
     CEDet: TControlEdit;
     CEDetPMEdit: TPopUpTeclas;
     DBChkBIncr: TLFDBCheckBox;
     DBEIncLacado: TLFDbedit;
     LblModelo: TLFLabel;
     LblLineal: TLFLabel;
     LblSalida: TLFLabel;
     DBELineal: TLFDbedit;
     DBESalida: TLFDbedit;
     DBEFModelo: TLFDBEditFind2000;
     LblM2: TLFLabel;
     DBEM2Lona: TLFDbedit;
     DBEUdsLona: TLFDbedit;
     LblUdsLona: TLFLabel;
     EM2Lona: TLFEdit;
     LFIncLacado: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure EFLacadoChange(Sender: TObject);
     procedure DBELinealChange(Sender: TObject);
     procedure DBESalidaChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBEUdsLonaChange(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
     HayOrden: boolean;
     procedure AbreDatos(ID: integer; Articulo, Titulo, TipoArt: string; AHayOrden: boolean);
  end;

var
  ZFMOfertasArtDet : TZFMOfertasArtDet;

implementation

uses UDMMain, ZUDMOfertasArtDet, UEntorno, UFMain, UUtiles;

{$R *.dfm}

procedure TZFMOfertasArtDet.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMOfertasArtDet, ZDMOfertasArtDet);

  ControlEdit := CEMain;
end;

procedure TZFMOfertasArtDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(ZDMOfertasArtDet);
end;

procedure TZFMOfertasArtDet.DBGFDetalleBusqueda(Sender: TObject);
begin
  DBGFDetalle.Filtros := [obEmpresa];

  if (DBGFDetalle.ColumnaActual = 'ESCANDALLO') then
     DBGFDetalle.CondicionBusqueda := 'compuesto=''' +
        ZDMOfertasArtDet.QMOfertasDetDETALLE.AsString + ''''
  else if (DBGFDetalle.ColumnaActual = 'DETALLE') then
  begin
     if (ZDMOfertasArtDet.xDatosDetalleTIPO_ARTICULO_TYC.AsString = 'M') then
     begin
        DBGFDetalle.Filtros := [];
        DBGFDetalle.Tablas[0] := 'Z_SYS_MODELOS_DET_MOTOR';
        DBGFDetalle.Numericos[0] := 'MOTOR';
        DBGFDetalle.Titulos[0] := 'MOTOR';

        ZDMOfertasArtDet.xLineaCalc.Close;
        ZDMOfertasArtDet.xLineaCalc.Params.ByName['MODELO'].AsString := ZDMOfertasArtDet.QMOfertasCabMODELO.AsString;
        ZDMOfertasArtDet.xLineaCalc.Params.ByName['LINEA'].AsInteger := ZDMOfertasArtDet.QMOfertasCabLINEAL.AsInteger;
        ZDMOfertasArtDet.xLineaCalc.Open;

        ZDMOfertasArtDet.xSalidaCalc.Close;
        ZDMOfertasArtDet.xSalidaCalc.Params.ByName['MODELO'].AsString := ZDMOfertasArtDet.QMOfertasCabMODELO.AsString;
        ZDMOfertasArtDet.xSalidaCalc.Params.ByName['LINEA'].AsInteger := ZDMOfertasArtDet.xLineaCalcLINEA.AsInteger;
        ZDMOfertasArtDet.xSalidaCalc.Params.ByName['SALIDA'].AsInteger := ZDMOfertasArtDet.QMOfertasCabSALIDA.AsInteger;
        ZDMOfertasArtDet.xSalidaCalc.Open;

        DBGFDetalle.CondicionBusqueda := 'codigo=''' + ZDMOfertasArtDet.QMOfertasCabMODELO.AsString + '''' +
           ' and linea=' + ZDMOfertasArtDet.xLineaCalcLINEA.AsString +
           ' and salida=' + ZDMOfertasArtDet.xSalidaCalcSALIDA.AsString;
     end
     else
     begin
        DBGFDetalle.Filtros := [obEmpresa, obEjercicio, obCanal];
        DBGFDetalle.Tablas[0] := 'VER_ARTICULOS_EF';
        DBGFDetalle.Numericos[0] := 'ARTICULO';
        DBGFDetalle.Titulos[0] := 'TITULO';

        if (ZDMOfertasArtDet.xDatosDetalleTIPO_ARTICULO_TYC.AsString = 'C') and
           (ZDMOfertasArtDet.xDatosDetalleFAMILIA.AsString = '1') then
           DBGFDetalle.CondicionBusqueda := 'familia=''' + ZDMOfertasArtDet.xDatosDetalleFAMILIA.AsString + ''''
        else
           DBGFDetalle.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
     end;
  end
  else
     DBGFDetalle.CondicionBusqueda := '';
end;

procedure TZFMOfertasArtDet.AbreDatos(ID: integer; Articulo, Titulo, TipoArt: string; AHayOrden: boolean);
begin
  ZDMOfertasArtDet.AbreDatos(ID);
  ECompuesto.Text := Articulo;
  EDescCompuesto.Text := Titulo;
  HayOrden := AHayOrden;

  {TipoArt -> T Toldo, A Armazón, L Lona y C Componente de subtipo corte}

  DBEM2Lona.Visible := (TipoArt[1] in ['L', 'T']);
  LblM2.Visible := (TipoArt[1] in ['L', 'T']);
  DBEUdsLona.Visible := (TipoArt[1] in ['L', 'C']);
  LblUdsLona.Visible := (TipoArt[1] in ['L', 'C']);
  LblLacado.Visible := (TipoArt[1] in ['T', 'A']);
  EFLacado.Visible := (TipoArt[1] in ['T', 'A']);
  DescLacado.Visible := (TipoArt[1] in ['T', 'A']);
  DBChkBMotor.Visible := (TipoArt[1] in ['T', 'A']);
  DBChkBIncr.Visible := (TipoArt[1] in ['T', 'A']);
  DBEIncLacado.Visible := (TipoArt[1] in ['T', 'A']);
  LblSalida.Visible := (TipoArt[1] in ['T', 'A', 'L']);
  DBESalida.Visible := (TipoArt[1] in ['T', 'A', 'L']);

  NavMain.EditaControl := EFLacado;

  if (HayOrden) then
  begin
     NavMain.Enabled := False;
     NavDetalle.Enabled := False;
     DBGFDetalle.ReadOnly := True;
     DBGFDetalle.Color := clInfoBk;
     DBGFDetalle.Font.Color := clGrayText;
  end
  else if (TipoArt[1] in ['L', 'C']) then
  begin
     NavMain.EditaControl := DBELineal;
     DBEFModelo.ReadOnly := True;
     DBEFModelo.TabStop := False;
     DBEFModelo.Color := clInfoBk;
     DBEFModelo.Font.Color := clGrayText;
  end;

  ShowModal;
end;


procedure TZFMOfertasArtDet.EFLacadoChange(Sender: TObject);
begin
  DescLacado.ActualizaDatos('LACADO', EFLacado.Text);
end;

procedure TZFMOfertasArtDet.DBELinealChange(Sender: TObject);
begin
  {
  if (DBELineal.Text <>'') and (DBESalida.Text <>'') then
    EM2.Text := FormatFloat (MascaraI,
      StrToInt(DBELineal.Text) *
      StrToInt(DBESalida.Text) / 10000)
  else
    EM2.Text :='0';
}
end;

procedure TZFMOfertasArtDet.DBESalidaChange(Sender: TObject);
begin
  {
  if (DBELineal.Text <>'') and (DBESalida.Text <>'') then
    EM2.Text := FormatFloat (MascaraI,
      StrToInt(DBELineal.Text) *
      StrToInt(DBESalida.Text) / 10000)
  else
    EM2.Text :='0';
}
end;

procedure TZFMOfertasArtDet.FormShow(Sender: TObject);
begin
  if not (HayOrden) then
     ZDMOfertasArtDet.QMOfertasCab.Edit;
end;

procedure TZFMOfertasArtDet.DBGFDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TZFMOfertasArtDet.DBGFDetalleDblClick(Sender: TObject);
begin
  if ZDMOfertasArtDet.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ESCANDALLO') then
     begin
        FMain.EjecutaAccion(FMain.AProEscandalloSF, 'Escandallo = ''' +
           ZDMOfertasArtDet.QMOfertasDetESCANDALLO.AsString + '''');
     end;
  end;
end;

procedure TZFMOfertasArtDet.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if ZDMOfertasArtDet.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'ESCANDALLO') then
        CeldaEnlace(DBGFDetalle, Rect);
  end;
end;

procedure TZFMOfertasArtDet.DBEUdsLonaChange(Sender: TObject);
begin
  {
  if (DBELineal.Text <>'') and (DBESalida.Text <>'') and (DBEUdsLona.Text <>'')then
    DBEM2Lona.Text := FormatFloat (MascaraI,
      StrToInt(DBEUdsLona.Text) *
      StrToInt(DBELineal.Text) *
      StrToInt(DBESalida.Text) / 10000)
  else
    DBEM2Lona.Text :='0';
}
end;

end.
