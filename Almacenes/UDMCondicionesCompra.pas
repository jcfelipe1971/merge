unit UDMCondicionesCompra;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBQuery, HYFIBQuery, Controls, Dialogs, FIBDataSetRO,
  FIBTableDataSetRO;

type
  TDMCondicionesCompra = class(TDataModule)
     TLocal: THYTransaction;
     QMCondProvArt: TFIBTableSet;
     DSQMCondProvArt: TDataSource;
     DSQMCondProvFam: TDataSource;
     QMCondProvAgrArt: TFIBTableSet;
     DSCondProvAgrArt: TDataSource;
     QMCondProvFam: TFIBTableSet;
     QMCondProvAgr: TFIBTableSet;
     DSCondProvAgr: TDataSource;
     QMCondProvArtEMPRESA: TIntegerField;
     QMCondProvArtEJERCICIO: TIntegerField;
     QMCondProvArtCANAL: TIntegerField;
     QMCondProvArtTIPO: TFIBStringField;
     QMCondProvArtRIG: TIntegerField;
     QMCondProvArtPROVEEDOR: TIntegerField;
     QMCondProvArtTITULO_PROVEEDOR: TFIBStringField;
     QMCondProvArtARTICULO: TFIBStringField;
     QMCondProvArtTITULO_ARTICULO: TFIBStringField;
     QMCondProvArtFAMILIA: TFIBStringField;
     QMCondProvArtTITULO_FAMILIA: TFIBStringField;
     QMCondProvArtAGRUPACION: TFIBStringField;
     QMCondProvArtTITULO_AGRUPACION: TFIBStringField;
     QMCondProvArtALTA: TDateTimeField;
     QMCondProvArtBAJA: TDateTimeField;
     QMCondProvArtACTIVO: TIntegerField;
     QMCondProvArtDESDE: TFloatField;
     QMCondProvArtHASTA: TFloatField;
     QMCondProvArtPRECIO: TFloatField;
     QMCondProvArtDTO1: TFloatField;
     QMCondProvArtDTO2: TFloatField;
     QMCondProvArtDTO3: TFloatField;
     QMCondProvArtLINEA: TIntegerField;
     QMCondProvFamEMPRESA: TIntegerField;
     QMCondProvFamEJERCICIO: TIntegerField;
     QMCondProvFamCANAL: TIntegerField;
     QMCondProvFamTIPO: TFIBStringField;
     QMCondProvFamRIG: TIntegerField;
     QMCondProvFamPROVEEDOR: TIntegerField;
     QMCondProvFamTITULO_PROVEEDOR: TFIBStringField;
     QMCondProvFamARTICULO: TFIBStringField;
     QMCondProvFamTITULO_ARTICULO: TFIBStringField;
     QMCondProvFamFAMILIA: TFIBStringField;
     QMCondProvFamTITULO_FAMILIA: TFIBStringField;
     QMCondProvFamAGRUPACION: TFIBStringField;
     QMCondProvFamTITULO_AGRUPACION: TFIBStringField;
     QMCondProvFamALTA: TDateTimeField;
     QMCondProvFamBAJA: TDateTimeField;
     QMCondProvFamACTIVO: TIntegerField;
     QMCondProvFamDESDE: TFloatField;
     QMCondProvFamHASTA: TFloatField;
     QMCondProvFamPRECIO: TFloatField;
     QMCondProvFamDTO1: TFloatField;
     QMCondProvFamDTO2: TFloatField;
     QMCondProvFamDTO3: TFloatField;
     QMCondProvFamLINEA: TIntegerField;
     QMCondProvAgrArtEMPRESA: TIntegerField;
     QMCondProvAgrArtEJERCICIO: TIntegerField;
     QMCondProvAgrArtCANAL: TIntegerField;
     QMCondProvAgrArtTIPO: TFIBStringField;
     QMCondProvAgrArtRIG: TIntegerField;
     QMCondProvAgrArtPROVEEDOR: TIntegerField;
     QMCondProvAgrArtTITULO_PROVEEDOR: TFIBStringField;
     QMCondProvAgrArtARTICULO: TFIBStringField;
     QMCondProvAgrArtTITULO_ARTICULO: TFIBStringField;
     QMCondProvAgrArtFAMILIA: TFIBStringField;
     QMCondProvAgrArtTITULO_FAMILIA: TFIBStringField;
     QMCondProvAgrArtAGRUPACION: TFIBStringField;
     QMCondProvAgrArtTITULO_AGRUPACION: TFIBStringField;
     QMCondProvAgrArtALTA: TDateTimeField;
     QMCondProvAgrArtBAJA: TDateTimeField;
     QMCondProvAgrArtACTIVO: TIntegerField;
     QMCondProvAgrArtDESDE: TFloatField;
     QMCondProvAgrArtHASTA: TFloatField;
     QMCondProvAgrArtPRECIO: TFloatField;
     QMCondProvAgrArtDTO1: TFloatField;
     QMCondProvAgrArtDTO2: TFloatField;
     QMCondProvAgrArtDTO3: TFloatField;
     QMCondProvAgrArtLINEA: TIntegerField;
     QMCondProvAgrEMPRESA: TIntegerField;
     QMCondProvAgrEJERCICIO: TIntegerField;
     QMCondProvAgrCANAL: TIntegerField;
     QMCondProvAgrTIPO: TFIBStringField;
     QMCondProvAgrRIG: TIntegerField;
     QMCondProvAgrPROVEEDOR: TIntegerField;
     QMCondProvAgrTITULO_PROVEEDOR: TFIBStringField;
     QMCondProvAgrARTICULO: TFIBStringField;
     QMCondProvAgrTITULO_ARTICULO: TFIBStringField;
     QMCondProvAgrFAMILIA: TFIBStringField;
     QMCondProvAgrTITULO_FAMILIA: TFIBStringField;
     QMCondProvAgrAGRUPACION: TFIBStringField;
     QMCondProvAgrTITULO_AGRUPACION: TFIBStringField;
     QMCondProvAgrALTA: TDateTimeField;
     QMCondProvAgrBAJA: TDateTimeField;
     QMCondProvAgrACTIVO: TIntegerField;
     QMCondProvAgrDESDE: TFloatField;
     QMCondProvAgrHASTA: TFloatField;
     QMCondProvAgrPRECIO: TFloatField;
     QMCondProvAgrDTO1: TFloatField;
     QMCondProvAgrDTO2: TFloatField;
     QMCondProvAgrDTO3: TFloatField;
     QMCondProvAgrLINEA: TIntegerField;
     TUpdate: THYTransaction;
     QMCondProvArtPorPrecio: TFIBTableSet;
     DSQMCondProvArtPorPrecio: TDataSource;
     DSQMCondProvFamPorPrecio: TDataSource;
     QMCondProvAgrArtPorPrecio: TFIBTableSet;
     DSCondProvAgrArtPorPrecio: TDataSource;
     QMCondProvFamPorPrecio: TFIBTableSet;
     QMCondProvAgrPorPrecio: TFIBTableSet;
     DSCondProvAgrPorPrecio: TDataSource;
     QMCondProvAgrPorPrecioEMPRESA: TIntegerField;
     QMCondProvAgrPorPrecioEJERCICIO: TIntegerField;
     QMCondProvAgrPorPrecioCANAL: TIntegerField;
     QMCondProvAgrPorPrecioTIPO: TFIBStringField;
     QMCondProvAgrPorPrecioRIG: TIntegerField;
     QMCondProvAgrPorPrecioPROVEEDOR: TIntegerField;
     QMCondProvAgrPorPrecioTITULO_PROVEEDOR: TFIBStringField;
     QMCondProvAgrPorPrecioARTICULO: TFIBStringField;
     QMCondProvAgrPorPrecioTITULO_ARTICULO: TFIBStringField;
     QMCondProvAgrPorPrecioFAMILIA: TFIBStringField;
     QMCondProvAgrPorPrecioTITULO_FAMILIA: TFIBStringField;
     QMCondProvAgrPorPrecioAGRUPACION: TFIBStringField;
     QMCondProvAgrPorPrecioTITULO_AGRUPACION: TFIBStringField;
     QMCondProvAgrPorPrecioALTA: TDateTimeField;
     QMCondProvAgrPorPrecioBAJA: TDateTimeField;
     QMCondProvAgrPorPrecioACTIVO: TIntegerField;
     QMCondProvAgrPorPrecioDESDE: TFloatField;
     QMCondProvAgrPorPrecioHASTA: TFloatField;
     QMCondProvAgrPorPrecioDTO1: TFloatField;
     QMCondProvAgrPorPrecioDTO2: TFloatField;
     QMCondProvAgrPorPrecioDTO3: TFloatField;
     QMCondProvAgrPorPrecioLINEA: TIntegerField;
     QMCondProvArtPorPrecioEMPRESA: TIntegerField;
     QMCondProvArtPorPrecioEJERCICIO: TIntegerField;
     QMCondProvArtPorPrecioCANAL: TIntegerField;
     QMCondProvArtPorPrecioTIPO: TFIBStringField;
     QMCondProvArtPorPrecioRIG: TIntegerField;
     QMCondProvArtPorPrecioPROVEEDOR: TIntegerField;
     QMCondProvArtPorPrecioTITULO_PROVEEDOR: TFIBStringField;
     QMCondProvArtPorPrecioARTICULO: TFIBStringField;
     QMCondProvArtPorPrecioTITULO_ARTICULO: TFIBStringField;
     QMCondProvArtPorPrecioFAMILIA: TFIBStringField;
     QMCondProvArtPorPrecioTITULO_FAMILIA: TFIBStringField;
     QMCondProvArtPorPrecioAGRUPACION: TFIBStringField;
     QMCondProvArtPorPrecioTITULO_AGRUPACION: TFIBStringField;
     QMCondProvArtPorPrecioALTA: TDateTimeField;
     QMCondProvArtPorPrecioBAJA: TDateTimeField;
     QMCondProvArtPorPrecioACTIVO: TIntegerField;
     QMCondProvArtPorPrecioDESDE: TFloatField;
     QMCondProvArtPorPrecioHASTA: TFloatField;
     QMCondProvArtPorPrecioDTO1: TFloatField;
     QMCondProvArtPorPrecioDTO2: TFloatField;
     QMCondProvArtPorPrecioDTO3: TFloatField;
     QMCondProvArtPorPrecioLINEA: TIntegerField;
     QMCondProvFamPorPrecioEMPRESA: TIntegerField;
     QMCondProvFamPorPrecioEJERCICIO: TIntegerField;
     QMCondProvFamPorPrecioCANAL: TIntegerField;
     QMCondProvFamPorPrecioTIPO: TFIBStringField;
     QMCondProvFamPorPrecioRIG: TIntegerField;
     QMCondProvFamPorPrecioPROVEEDOR: TIntegerField;
     QMCondProvFamPorPrecioTITULO_PROVEEDOR: TFIBStringField;
     QMCondProvFamPorPrecioARTICULO: TFIBStringField;
     QMCondProvFamPorPrecioTITULO_ARTICULO: TFIBStringField;
     QMCondProvFamPorPrecioFAMILIA: TFIBStringField;
     QMCondProvFamPorPrecioTITULO_FAMILIA: TFIBStringField;
     QMCondProvFamPorPrecioAGRUPACION: TFIBStringField;
     QMCondProvFamPorPrecioTITULO_AGRUPACION: TFIBStringField;
     QMCondProvFamPorPrecioALTA: TDateTimeField;
     QMCondProvFamPorPrecioBAJA: TDateTimeField;
     QMCondProvFamPorPrecioACTIVO: TIntegerField;
     QMCondProvFamPorPrecioDESDE: TFloatField;
     QMCondProvFamPorPrecioHASTA: TFloatField;
     QMCondProvFamPorPrecioDTO1: TFloatField;
     QMCondProvFamPorPrecioDTO2: TFloatField;
     QMCondProvFamPorPrecioDTO3: TFloatField;
     QMCondProvFamPorPrecioLINEA: TIntegerField;
     QMCondProvAgrArtPorPrecioEMPRESA: TIntegerField;
     QMCondProvAgrArtPorPrecioEJERCICIO: TIntegerField;
     QMCondProvAgrArtPorPrecioCANAL: TIntegerField;
     QMCondProvAgrArtPorPrecioTIPO: TFIBStringField;
     QMCondProvAgrArtPorPrecioRIG: TIntegerField;
     QMCondProvAgrArtPorPrecioPROVEEDOR: TIntegerField;
     QMCondProvAgrArtPorPrecioTITULO_PROVEEDOR: TFIBStringField;
     QMCondProvAgrArtPorPrecioARTICULO: TFIBStringField;
     QMCondProvAgrArtPorPrecioTITULO_ARTICULO: TFIBStringField;
     QMCondProvAgrArtPorPrecioFAMILIA: TFIBStringField;
     QMCondProvAgrArtPorPrecioTITULO_FAMILIA: TFIBStringField;
     QMCondProvAgrArtPorPrecioAGRUPACION: TFIBStringField;
     QMCondProvAgrArtPorPrecioTITULO_AGRUPACION: TFIBStringField;
     QMCondProvAgrArtPorPrecioALTA: TDateTimeField;
     QMCondProvAgrArtPorPrecioBAJA: TDateTimeField;
     QMCondProvAgrArtPorPrecioACTIVO: TIntegerField;
     QMCondProvAgrArtPorPrecioDESDE: TFloatField;
     QMCondProvAgrArtPorPrecioHASTA: TFloatField;
     QMCondProvAgrArtPorPrecioDTO1: TFloatField;
     QMCondProvAgrArtPorPrecioDTO2: TFloatField;
     QMCondProvAgrArtPorPrecioDTO3: TFloatField;
     QMCondProvAgrArtPorPrecioLINEA: TIntegerField;
     QMCondProvArtPorPrecioUNIDADES: TFloatField;
     QMCondProvFamPorPrecioUNIDADES: TFloatField;
     QMCondProvAgrArtPorPrecioUNIDADES: TFloatField;
     QMCondProvAgrPorPrecioUNIDADES: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMCondProvArtNewRecord(DataSet: TDataSet);
     procedure QMCondProvFamNewRecord(DataSet: TDataSet);
     procedure QMCondProvArtARTICULOChange(Sender: TField);
     procedure QMCondProvAgrArtNewRecord(DataSet: TDataSet);
     procedure QMCondProVAgrArtARTICULOChange(Sender: TField);
     procedure QMCondProvFamFAMILIAChange(Sender: TField);
     procedure QMCondProvAgrArtAGRUPACIONChange(Sender: TField);
     procedure QMCondProvAgrNewRecord(DataSet: TDataSet);
     procedure QMCondProvAgrAGRUPACIONChange(Sender: TField);
     procedure QMCondProvArtPorPrecioNewRecord(DataSet: TDataSet);
     procedure QMCondProvFamPorPrecioNewRecord(DataSet: TDataSet);
     procedure QMCondProvAgrArtPorPrecioNewRecord(DataSet: TDataSet);
     procedure QMCondProvAgrPorPrecioNewRecord(DataSet: TDataSet);
     procedure QMCondProvArtPorPrecioARTICULOChange(Sender: TField);
     procedure QMCondProvFamPorPrecioFAMILIAChange(Sender: TField);
     procedure QMCondProvAgrArtPorPrecioAGRUPACIONChange(Sender: TField);
     procedure QMCondProvAgrPorPrecioAGRUPACIONChange(Sender: TField);
  private
     { Private declarations }
     Proveedor: integer;
     function NuevaLinea(Tipo: string): integer;
  public
     { Public declarations }
     SQLBase: TStrings;
     //function BusquedaCompleja(tipo: integer): integer;
     function BusquedaCompleja(tabla: TFIBTableSet; tip: string): integer;
     function HayDetalle: boolean;
     procedure FiltrarProveedor(aProveedor: integer);
     procedure PosicionaArticulo(Articulo: string);
     procedure PosicionaFamilia(Familia: string);
     procedure PosicionaArticuloPorPrecio(Articulo: string);
     procedure PosicionaFamiliaPorPrecio(Familia: string);
  end;

var
  DMCondicionesCompra : TDMCondicionesCompra;

implementation

uses UDMMain, UEntorno, UDameDato, uFBusca, DateUtils, StrUtils;

{$R *.dfm}

procedure TDMCondicionesCompra.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Máscaras
  QMCondProvArtDESDE.DisplayFormat := MascaraN;
  QMCondProvArtHASTA.DisplayFormat := MascaraN;
  QMCondProvArtDTO1.DisplayFormat := MascaraP;
  QMCondProvArtDTO2.DisplayFormat := MascaraP;
  QMCondProvArtDTO3.DisplayFormat := MascaraP;
  QMCondProvArtPRECIO.DisplayFormat := MascaraL;

  QMCondProvFamDESDE.DisplayFormat := MascaraN;
  QMCondProvFamHASTA.DisplayFormat := MascaraN;
  QMCondProvFamDTO1.DisplayFormat := MascaraP;
  QMCondProvFamDTO2.DisplayFormat := MascaraP;
  QMCondProvFamDTO3.DisplayFormat := MascaraP;

  QMCondProvAgrArtDESDE.DisplayFormat := MascaraN;
  QMCondProvAgrArtHASTA.DisplayFormat := MascaraN;
  QMCondProvAgrArtDTO1.DisplayFormat := MascaraP;
  QMCondProvAgrArtDTO2.DisplayFormat := MascaraP;
  QMCondProvAgrArtDTO3.DisplayFormat := MascaraP;
  QMCondProvAgrArtPRECIO.DisplayFormat := MascaraL;

  QMCondProvAgrDESDE.DisplayFormat := MascaraN;
  QMCondProvAgrHASTA.DisplayFormat := MascaraN;
  QMCondProvAgrDTO1.DisplayFormat := MascaraP;
  QMCondProvAgrDTO2.DisplayFormat := MascaraP;
  QMCondProvAgrDTO3.DisplayFormat := MascaraP;
  QMCondProvAgrPRECIO.DisplayFormat := MascaraL;

  QMCondProvArtPorPrecioDESDE.DisplayFormat := MascaraN;
  QMCondProvArtPorPrecioHASTA.DisplayFormat := MascaraN;
  QMCondProvArtPorPrecioDTO1.DisplayFormat := MascaraP;
  QMCondProvArtPorPrecioDTO2.DisplayFormat := MascaraP;
  QMCondProvArtPorPrecioDTO3.DisplayFormat := MascaraP;
  QMCondProvArtPorPrecioUNIDADES.DisplayFormat := MascaraP;

  QMCondProvFamPorPrecioDESDE.DisplayFormat := MascaraN;
  QMCondProvFamPorPrecioHASTA.DisplayFormat := MascaraN;
  QMCondProvFamPorPrecioDTO1.DisplayFormat := MascaraP;
  QMCondProvFamPorPrecioDTO2.DisplayFormat := MascaraP;
  QMCondProvFamPorPrecioDTO3.DisplayFormat := MascaraP;
  QMCondProvFamPorPrecioUNIDADES.DisplayFormat := MascaraP;

  QMCondProvAgrArtPorPrecioDESDE.DisplayFormat := MascaraN;
  QMCondProvAgrArtPorPrecioHASTA.DisplayFormat := MascaraN;
  QMCondProvAgrArtPorPrecioDTO1.DisplayFormat := MascaraP;
  QMCondProvAgrArtPorPrecioDTO2.DisplayFormat := MascaraP;
  QMCondProvAgrArtPorPrecioDTO3.DisplayFormat := MascaraP;
  QMCondProvAgrArtPorPrecioUNIDADES.DisplayFormat := MascaraP;

  QMCondProvAgrPorPrecioDESDE.DisplayFormat := MascaraN;
  QMCondProvAgrPorPrecioHASTA.DisplayFormat := MascaraN;
  QMCondProvAgrPorPrecioDTO1.DisplayFormat := MascaraP;
  QMCondProvAgrPorPrecioDTO2.DisplayFormat := MascaraP;
  QMCondProvAgrPorPrecioDTO3.DisplayFormat := MascaraP;
  QMCondProvAgrPorPrecioUNIDADES.DisplayFormat := MascaraP;
end;

procedure TDMCondicionesCompra.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCondicionesCompra.QMCondProvArtNewRecord(DataSet: TDataSet);
begin
  QMCondProvArtEMPRESA.AsInteger := REntorno.Empresa;
  QMCondProvArtEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondProvArtCANAL.AsInteger := REntorno.Canal;
  QMCondProvArtTIPO.AsString := 'PRA';
  QMCondProvArtRIG.AsInteger := NuevaLinea('PRA');
  QMCondProvArtPROVEEDOR.AsInteger := Proveedor;
  QMCondProvArtALTA.AsDateTime := Date;
  QMCondProvArtBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondProvArtACTIVO.AsInteger := 1;
  QMCondProvArtPRECIO.AsFloat := 0;
  QMCondProvArtDTO1.AsFloat := 0;
  QMCondProvArtDTO2.AsFloat := 0;
  QMCondProvArtDTO3.AsFloat := 0;
end;

procedure TDMCondicionesCompra.QMCondProvFamNewRecord(DataSet: TDataSet);
begin
  QMCondProvFamEMPRESA.AsInteger := REntorno.Empresa;
  QMCondProvFamEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondProvFamCANAL.AsInteger := REntorno.Canal;
  QMCondProvFamTIPO.AsString := 'PRF';
  QMCondProvFamRIG.AsInteger := NuevaLinea('PRF');
  QMCondProvFamPROVEEDOR.AsInteger := Proveedor;
  QMCondProvFamALTA.AsDateTime := Date;
  QMCondProvFamBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondProvFamACTIVO.AsInteger := 1;
  QMCondProvFamPRECIO.AsFloat := 0;
  QMCondProvFamDTO1.AsFloat := 0;
  QMCondProvFamDTO2.AsFloat := 0;
  QMCondProvFamDTO3.AsFloat := 0;
end;

function TDMCondicionesCompra.BusquedaCompleja(tabla: TFIBTableSet; tip: string): integer;
var
  SQL, Orden : string;
begin
  with tabla do
  begin
     DisableControls;
     Close;
     SQL := SelectSQL.Text;
     Orden := OrdenadoPor;
     Ordenar('');
     Result := TFBusca.Create(Self).SeleccionaBusqueda(tabla, '11100', False);
     if (Result = mrCancel) then
        SelectSQL.Text := SQL
     else
     begin
        if Pos('WHERE', UpperCase(SelectSQL.Text)) <> 0 then
           SelectSQL.Add('AND')
        else
           SelectSQL.Add('WHERE');
        SelectSQL.Add('(TIPO=' + '''' + tip + ''') ');
        SelectSQL.Add(' AND PROVEEDOR= ' + IntToStr(Proveedor));
        Ordenar(Orden);
     end;
     Open;
     EnableControls;
  end;
end;

procedure TDMCondicionesCompra.QMCondProvArtARTICULOChange(Sender: TField);
begin
  QMCondProvArtTITULO_ARTICULO.AsString := DameTituloArticulo(QMCondProvArtARTICULO.AsString);
end;

procedure TDMCondicionesCompra.FiltrarProveedor(aProveedor: integer);
var
  SQL : TStrings;
begin
  Proveedor := aProveedor;
  SQL := TStringList.Create;
  try
     SQL.Add(' SELECT * FROM VER_CONDICIONES_PROVEEDOR ');
     SQL.Add(' WHERE ');
     SQL.Add(' EMPRESA = ?EMPRESA AND ');
     SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SQL.Add(' CANAL = ?CANAL AND ');
     SQL.Add(' PROVEEDOR = ?PROVEEDOR ');

     with QMCondProvArt do
     begin
        Close;
        SelectSQL.Text := SQL.Text;
        SelectSQL.Add(' AND TIPO = ''PRA'' ');
        SelectSQL.Add(' ORDER BY ARTICULO, ALTA DESC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Open;
     end;

     with QMCondProvFam do
     begin
        Close;
        SelectSQL.Text := SQL.Text;
        SelectSQL.Add(' AND TIPO = ''PRF'' ');
        SelectSQL.Add(' ORDER BY FAMILIA, ALTA DESC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Open;
     end;

     with QMCondProvAgrArt do
     begin
        Close;
        SelectSQL.Text := SQL.Text;
        SelectSQL.Add(' AND TIPO = ''PRG'' ');
        SelectSQL.Add(' ORDER BY ARTICULO, ALTA DESC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Open;
     end;

     with QMCondProvAgr do
     begin
        Close;
        SelectSQL.Text := SQL.Text;
        SelectSQL.Add(' AND TIPO = ''PRU'' ');
        SelectSQL.Add(' ORDER BY AGRUPACION, ALTA DESC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Open;
     end;

     {Por Precio}
     SQL.Clear;
     SQL.Add(' SELECT * FROM VER_CONDICIONES_PROVEEDOR_PREC ');
     SQL.Add(' WHERE ');
     SQL.Add(' EMPRESA = ?EMPRESA AND ');
     SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SQL.Add(' CANAL = ?CANAL AND ');
     SQL.Add(' PROVEEDOR = ?PROVEEDOR ');

     with QMCondProvArtPorPrecio do
     begin
        Close;
        SelectSQL.Text := SQL.Text;
        SelectSQL.Add(' AND TIPO = ''PRA'' ');
        SelectSQL.Add(' ORDER BY ARTICULO, ALTA DESC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Open;
     end;

     with QMCondProvFamPorPrecio do
     begin
        Close;
        SelectSQL.Text := SQL.Text;
        SelectSQL.Add(' AND TIPO = ''PRF'' ');
        SelectSQL.Add(' ORDER BY FAMILIA, ALTA DESC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Open;
     end;

     with QMCondProvAgrArtPorPrecio do
     begin
        Close;
        SelectSQL.Text := SQL.Text;
        SelectSQL.Add(' AND TIPO = ''PRG'' ');
        SelectSQL.Add(' ORDER BY AGRUPACION, ALTA DESC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Open;
     end;

     with QMCondProvAgrPorPrecio do
     begin
        Close;
        SelectSQL.Text := SQL.Text;
        SelectSQL.Add(' AND TIPO = ''PRU'' ');
        SelectSQL.Add(' ORDER BY AGRUPACION, ALTA DESC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Open;
     end;
  finally
     SQL.Free;
  end;
end;

procedure TDMCondicionesCompra.QMCondProvAgrArtNewRecord(DataSet: TDataSet);
begin
  QMCondProVAgrArtEMPRESA.AsInteger := REntorno.Empresa;
  QMCondProvAgrArtEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondProvAgrArtCANAL.AsInteger := REntorno.Canal;
  QMCondProvAgrArtTIPO.AsString := 'PRG';
  QMCondProvAgrArtRIG.AsInteger := NuevaLinea('PRG');
  QMCondProvAgrArtPROVEEDOR.AsInteger := Proveedor;
  QMCondProvAgrArtALTA.AsDateTime := Date;
  QMCondProvAgrArtBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondProvAgrArtACTIVO.AsInteger := 1;
  QMCondProvAgrArtPRECIO.AsFloat := 0;
  QMCondProvAgrArtDTO1.AsFloat := 0;
  QMCondProvAGrArtDTO2.AsFloat := 0;
  QMCondProvAgrArtDTO3.AsFloat := 0;
end;

procedure TDMCondicionesCompra.QMCondProVAgrArtARTICULOChange(Sender: TField);
begin
  QMCondProvAgrArtTITULO_AGRUPACION.AsString := DameTituloAgrupacion('P', QMCondProvAgrArtAGRUPACION.AsString);
end;

procedure TDMCondicionesCompra.QMCondProvFamFAMILIAChange(Sender: TField);
begin
  QMCondProvFamTITULO_FAMILIA.AsString := DameTituloFamilia(QMCondProvFamFAMILIA.AsString);
end;

procedure TDMCondicionesCompra.QMCondProvAgrArtAGRUPACIONChange(Sender: TField);
begin
  QMCondProvAgrArtTITULO_AGRUPACION.AsString := DameTituloAgrupacion('T', QMCondProVAgrArtAGRUPACION.AsString);
end;

function TDMCondicionesCompra.NuevaLinea(Tipo: string): integer;
begin
  Result := DMMain.Contador_EEC(Tipo);
end;

procedure TDMCondicionesCompra.QMCondProvAgrNewRecord(DataSet: TDataSet);
begin
  QMCondProVAgrEMPRESA.AsInteger := REntorno.Empresa;
  QMCondProvAgrEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondProvAgrCANAL.AsInteger := REntorno.Canal;
  QMCondProvAgrTIPO.AsString := 'PRU';
  QMCondProvAgrRIG.AsInteger := NuevaLinea('PRU');
  QMCondProvAgrPROVEEDOR.AsInteger := Proveedor;
  QMCondProvAgrALTA.AsDateTime := Date;
  QMCondProvAgrBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondProvAgrACTIVO.AsInteger := 1;
  QMCondProvAgrPRECIO.AsFloat := 0;
  QMCondProvAgrDTO1.AsFloat := 0;
  QMCondProvAGrDTO2.AsFloat := 0;
  QMCondProvAgrDTO3.AsFloat := 0;
end;

procedure TDMCondicionesCompra.QMCondProvAgrAGRUPACIONChange(Sender: TField);
begin
  QMCondProvAgrTITULO_AGRUPACION.AsString := DameTituloAgrupacion('P', QMCondProVAgrAGRUPACION.AsString);
end;

procedure TDMCondicionesCompra.QMCondProvArtPorPrecioNewRecord(DataSet: TDataSet);
begin
  QMCondProvArtPorPrecioEMPRESA.AsInteger := REntorno.Empresa;
  QMCondProvArtPorPrecioEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondProvArtPorPrecioCANAL.AsInteger := REntorno.Canal;
  QMCondProvArtPorPrecioTIPO.AsString := 'PRA';
  QMCondProvArtPorPrecioRIG.AsInteger := NuevaLinea('PRA');
  QMCondProvArtPorPrecioPROVEEDOR.AsInteger := Proveedor;
  QMCondProvArtPorPrecioALTA.AsDateTime := Date;
  QMCondProvArtPorPrecioBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondProvArtPorPrecioACTIVO.AsInteger := 1;
  QMCondProvArtPorPrecioUNIDADES.AsFloat := 0;
  QMCondProvArtPorPrecioDTO1.AsFloat := 0;
  QMCondProvArtPorPrecioDTO2.AsFloat := 0;
  QMCondProvArtPorPrecioDTO3.AsFloat := 0;
end;

procedure TDMCondicionesCompra.QMCondProvFamPorPrecioNewRecord(DataSet: TDataSet);
begin
  QMCondProvFamPorPrecioEMPRESA.AsInteger := REntorno.Empresa;
  QMCondProvFamPorPrecioEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondProvFamPorPrecioCANAL.AsInteger := REntorno.Canal;
  QMCondProvFamPorPrecioTIPO.AsString := 'PRF';
  QMCondProvFamPorPrecioRIG.AsInteger := NuevaLinea('PRF');
  QMCondProvFamPorPrecioPROVEEDOR.AsInteger := Proveedor;
  QMCondProvFamPorPrecioALTA.AsDateTime := Date;
  QMCondProvFamPorPrecioBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondProvFamPorPrecioACTIVO.AsInteger := 1;
  QMCondProvFamPorPrecioUNIDADES.AsFloat := 0;
  QMCondProvFamPorPrecioDTO1.AsFloat := 0;
  QMCondProvFamPorPrecioDTO2.AsFloat := 0;
  QMCondProvFamPorPrecioDTO3.AsFloat := 0;
end;

procedure TDMCondicionesCompra.QMCondProvAgrArtPorPrecioNewRecord(DataSet: TDataSet);
begin
  QMCondProVAgrArtPorPrecioEMPRESA.AsInteger := REntorno.Empresa;
  QMCondProvAgrArtPorPrecioEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondProvAgrArtPorPrecioCANAL.AsInteger := REntorno.Canal;
  QMCondProvAgrArtPorPrecioTIPO.AsString := 'PRG';
  QMCondProvAgrArtPorPrecioRIG.AsInteger := NuevaLinea('PRG');
  QMCondProvAgrArtPorPrecioPROVEEDOR.AsInteger := Proveedor;
  QMCondProvAgrArtPorPrecioALTA.AsDateTime := Date;
  QMCondProvAgrArtPorPrecioBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondProvAgrArtPorPrecioACTIVO.AsInteger := 1;
  QMCondProvAgrArtPorPrecioUNIDADES.AsFloat := 0;
  QMCondProvAgrArtPorPrecioDTO1.AsFloat := 0;
  QMCondProvAGrArtPorPrecioDTO2.AsFloat := 0;
  QMCondProvAgrArtPorPrecioDTO3.AsFloat := 0;
end;

procedure TDMCondicionesCompra.QMCondProvAgrPorPrecioNewRecord(DataSet: TDataSet);
begin
  QMCondProVAgrPorPrecioEMPRESA.AsInteger := REntorno.Empresa;
  QMCondProvAgrPorPrecioEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondProvAgrPorPrecioCANAL.AsInteger := REntorno.Canal;
  QMCondProvAgrPorPrecioTIPO.AsString := 'PRU';
  QMCondProvAgrPorPrecioRIG.AsInteger := NuevaLinea('PRU');
  QMCondProvAgrPorPrecioPROVEEDOR.AsInteger := Proveedor;
  QMCondProvAgrPorPrecioALTA.AsDateTime := Date;
  QMCondProvAgrPorPrecioBAJA.AsDateTime := EncodeDate(REntorno.Ejercicio, 12, 31);
  QMCondProvAgrPorPrecioACTIVO.AsInteger := 1;
  QMCondProvAgrPorPrecioUNIDADES.AsFloat := 0;
  QMCondProvAgrPorPrecioDTO1.AsFloat := 0;
  QMCondProvAGrPorPrecioDTO2.AsFloat := 0;
  QMCondProvAgrPorPrecioDTO3.AsFloat := 0;
end;

procedure TDMCondicionesCompra.QMCondProvArtPorPrecioARTICULOChange(Sender: TField);
begin
  QMCondProvArtPorPrecioTITULO_ARTICULO.AsString := DameTituloArticulo(QMCondProvArtPorPrecioARTICULO.AsString);
end;

procedure TDMCondicionesCompra.QMCondProvFamPorPrecioFAMILIAChange(Sender: TField);
begin
  QMCondProvFamPorPrecioTITULO_FAMILIA.AsString := DameTituloFamilia(QMCondProvFamPorPrecioFAMILIA.AsString);
end;

procedure TDMCondicionesCompra.QMCondProvAgrArtPorPrecioAGRUPACIONChange(Sender: TField);
begin
  QMCondProvAgrArtPorPrecioTITULO_AGRUPACION.AsString := DameTituloAgrupacion('T', QMCondProVAgrArtPorPrecioAGRUPACION.AsString);
end;

procedure TDMCondicionesCompra.QMCondProvAgrPorPrecioAGRUPACIONChange(Sender: TField);
begin
  QMCondProvAgrPorPrecioTITULO_AGRUPACION.AsString := DameTituloAgrupacion('P', QMCondProvAgrPorPrecioAGRUPACION.AsString);
end;

function TDMCondicionesCompra.HayDetalle: boolean;
begin
  Result := (QMCondProvArt.RecordCount > 0);
end;

procedure TDMCondicionesCompra.PosicionaArticulo(Articulo: string);
begin
  with QMCondProvArt do
  begin
     if Active then
     begin
        try
           DisableControls;
           First;
           while ((not EOF) and (FieldByName('ARTICULO').AsString <> Articulo)) do
              Next;
        finally
           EnableControls;
        end;
     end;
  end;
end;

procedure TDMCondicionesCompra.PosicionaFamilia(Familia: string);
begin
  with QMCondProvFam do
  begin
     if Active then
     begin
        try
           DisableControls;
           First;
           while ((not EOF) and (FieldByName('FAMILIA').AsString <> Familia)) do
              Next;
        finally
           EnableControls;
        end;
     end;
  end;
end;

procedure TDMCondicionesCompra.PosicionaArticuloPorPrecio(Articulo: string);
begin
  with QMCondProvArtPorPrecio do
  begin
     if Active then
     begin
        try
           DisableControls;
           First;
           while ((not EOF) and (FieldByName('ARTICULO').AsString <> Articulo)) do
              Next;
        finally
           EnableControls;
        end;
     end;
  end;
end;

procedure TDMCondicionesCompra.PosicionaFamiliaPorPrecio(Familia: string);
begin
  with QMCondProvFamPorPrecio do
  begin
     if Active then
     begin
        try
           DisableControls;
           First;
           while ((not EOF) and (FieldByName('FAMILIA').AsString <> Familia)) do
              Next;
        finally
           EnableControls;
        end;
     end;
  end;
end;

end.
