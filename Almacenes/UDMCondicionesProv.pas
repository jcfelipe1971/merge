unit UDMCondicionesProv;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet,
  UComponentesBusquedaFiltrada, FIBQuery, HYFIBQuery, FIBDataSetRO;

type
  TDMCondicionesProv = class(TDataModule)
     TLocal: THYTransaction;
     DSxProveedores: TDataSource;
     QMCondArticulos: TFIBTableSet;
     DSQMCondArticulos: TDataSource;
     xProveedores: TFIBDataSetRO;
     xArticulos: TFIBDataSetRO;
     xArticulosEMPRESA: TIntegerField;
     xArticulosARTICULO: TFIBStringField;
     xArticulosTITULO: TFIBStringField;
     DSxArticulos: TDataSource;
     QMCondFamilias: TFIBTableSet;
     DSQMCondFamilias: TDataSource;
     xFamilias: TFIBDataSetRO;
     DSxFamilias: TDataSource;
     xFamiliasEMPRESA: TIntegerField;
     xFamiliasFAMILIA: TFIBStringField;
     xFamiliasTITULO: TFIBStringField;
     QMCondFamiliasEMPRESA: TIntegerField;
     QMCondFamiliasEJERCICIO: TIntegerField;
     QMCondFamiliasCANAL: TIntegerField;
     QMCondFamiliasPROVEEDOR: TIntegerField;
     QMCondFamiliasFAMILIA: TFIBStringField;
     QMCondFamiliasDESCUENTO_1: TFloatField;
     QMCondFamiliasDESCUENTO_2: TFloatField;
     QMCondFamiliasDESCUENTO_3: TFloatField;
     QMCondFamiliasALTA: TDateTimeField;
     QMCondFamiliasBAJA: TDateTimeField;
     QMCondFamiliasACTIVO: TIntegerField;
     QMCondFamiliasBLOQUEADO: TIntegerField;
     QMCondFamiliasTITULO: TFIBStringField;
     QMCondArticulosEMPRESA: TIntegerField;
     QMCondArticulosEJERCICIO: TIntegerField;
     QMCondArticulosCANAL: TIntegerField;
     QMCondArticulosPROVEEDOR: TIntegerField;
     QMCondArticulosARTICULO: TFIBStringField;
     QMCondArticulosPRECIO: TFloatField;
     QMCondArticulosDESCUENTO_1: TFloatField;
     QMCondArticulosDESCUENTO_2: TFloatField;
     QMCondArticulosDESCUENTO_3: TFloatField;
     QMCondArticulosALTA: TDateTimeField;
     QMCondArticulosBAJA: TDateTimeField;
     QMCondArticulosACTIVO: TIntegerField;
     QMCondArticulosBLOQUEADO: TIntegerField;
     QMCondArticulosTITULO: TFIBStringField;
     xProveedoresEMPRESA: TIntegerField;
     xProveedoresEJERCICIO: TIntegerField;
     xProveedoresCANAL: TIntegerField;
     xProveedoresPROVEEDOR: TIntegerField;
     xProveedoresNOMBRE_R_SOCIAL: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DMCondicionescliCreate(Sender: TObject);
     procedure QMCondArticulosARTICULOChange(Sender: TField);
     procedure QMCondArticulosNewRecord(DataSet: TDataSet);
     procedure QMCondArticulosAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMCondFamiliasNewRecord(DataSet: TDataSet);
     procedure QMCondFamiliasFAMILIAChange(Sender: TField);
     procedure QMCondFamiliasAfterOpen(DataSet: TDataSet);
     procedure QMCondArticulosBeforePost(DataSet: TDataSet);
     procedure QMCondArticulosAfterCancel(DataSet: TDataSet);
     procedure QMCondFamiliasAfterCancel(DataSet: TDataSet);
     procedure QMCondFamiliasBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     procedure ControlaDupArt;
     procedure ControlaDupFam;
  public
     { Public declarations }
     procedure FiltrarProveedor(Proveedor: integer);
  end;

var
  DMCondicionesProv : TDMCondicionesProv;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TDMCondicionesProv.DMCondicionescliCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  xProveedores.Close;
  xFamilias.Close;
  QMCondArticulosPRECIO.DisplayFormat := MascaraN;
  QMCondArticulosDESCUENTO_1.DisplayFormat := MascaraP;
  QMCondArticulosDESCUENTO_2.DisplayFormat := MascaraP;
  QMCondArticulosDESCUENTO_3.DisplayFormat := MascaraP;
  QMCondFamiliasDESCUENTO_1.DisplayFormat := MascaraP;
  QMCondFamiliasDESCUENTO_2.DisplayFormat := MascaraP;
  QMCondFamiliasDESCUENTO_3.DisplayFormat := MascaraP;
end;

procedure TDMCondicionesProv.FiltrarProveedor(Proveedor: integer);
begin
  with xProveedores do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Open;
  end;

  with QMCondArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Open;
  end;

  with QMCondFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Open;
  end;
end;

procedure TDMCondicionesProv.QMCondArticulosARTICULOChange(Sender: TField);
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := QMCondArticulosARTICULO.AsString;
     Open;
  end;

  if QMCondArticulos.State in [dsInsert] then
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT PRECIO FROM G_PRECIO_CONDICION_PROVEEDOR(:EMPRESA, :EJERCICIO, :CANAL, :PROVEEDOR, :ARTICULO, :FECHA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PROVEEDOR'].AsInteger := xProveedoresPROVEEDOR.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMCondArticulosARTICULO.AsString;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab{SH};
           ExecQuery;
           QMCondArticulosPRECIO.AsFloat := FieldByName['PRECIO'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;

  ControlaDupArt;

  with xArticulos do
  begin
     Close;
     Open;
  end;
end;

procedure TDMCondicionesProv.QMCondArticulosNewRecord(DataSet: TDataSet);
begin
  QMCondArticulosEMPRESA.AsInteger := REntorno.Empresa;
  QMCondArticulosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondArticulosCANAL.AsInteger := REntorno.Canal;
  QMCondArticulosPROVEEDOR.AsInteger := xProveedoresPROVEEDOR.AsInteger;
  QMCondArticulosACTIVO.AsInteger := 1;
  QMCondArticulosBLOQUEADO.AsInteger := 0;
  QMCondArticulosALTA.AsDateTime := Date;
  QMCondArticulosBAJA.AsDateTime := Date;
  QMCondArticulosDESCUENTO_1.AsFloat := 0;
  QMCondArticulosDESCUENTO_2.AsFloat := 0;
  QMCondArticulosDESCUENTO_3.AsFloat := 0;
  xArticulos.Close;
end;

procedure TDMCondicionesProv.QMCondArticulosAfterOpen(DataSet: TDataSet);
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := QMCondArticulosARTICULO.AsString;
     Open;
  end;
end;

procedure TDMCondicionesProv.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCondicionesProv.QMCondFamiliasNewRecord(DataSet: TDataSet);
begin
  QMCondFamiliasEMPRESA.AsInteger := REntorno.Empresa;
  QMCondFamiliasEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondFamiliasCANAL.AsInteger := REntorno.Canal;
  QMCondFamiliasPROVEEDOR.AsInteger := xProveedoresPROVEEDOR.AsInteger;
  QMCondFamiliasACTIVO.AsInteger := 1;
  QMCondFamiliasBLOQUEADO.AsInteger := 0;
  QMCondFamiliasALTA.AsDateTime := Date;
  QMCondFamiliasBAJA.AsDateTime := Date;
  QMCondFamiliasDESCUENTO_1.AsFloat := 0;
  QMCondFamiliasDESCUENTO_2.AsFloat := 0;
  QMCondFamiliasDESCUENTO_3.AsFloat := 0;
  xFamilias.Close;
end;

procedure TDMCondicionesProv.QMCondFamiliasFAMILIAChange(Sender: TField);
begin
  with xFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAMILIA'].AsString := QMCondFamiliasFAMILIA.AsString;
     Open;
  end;
  ControlaDupFam;
  with xFamilias do
  begin
     Close;
     Open;
  end;
end;

procedure TDMCondicionesProv.QMCondFamiliasAfterOpen(DataSet: TDataSet);
begin
  with xFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAMILIA'].AsString := QMCondFamiliasFAMILIA.AsString;
     Open;
  end;
end;

procedure TDMCondicionesProv.ControlaDupArt;
var
  Duplicado : boolean;
begin
  //Duplicado := False;

  if (QMCondArticulos.State <> dsInsert) or
     (QMCondArticulosARTICULO.IsNull) then
     Exit;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPRESA FROM ART_CONDICIONES_PROV_ART WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND PROVEEDOR = :PROVEEDOR AND ARTICULO = :ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := QMCondArticulosPROVEEDOR.Value;
        Params.ByName['ARTICULO'].AsString := QMCondArticulosARTICULO.Value;
        ExecQuery;
        Duplicado := (FieldByName['EMPRESA'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if Duplicado then
     raise Exception.Create(_('Clave duplicada'));
end;

procedure TDMCondicionesProv.ControlaDupFam;
var
  Duplicado : boolean;
begin
  //Duplicado := False;
  if (QMCondFamilias.State <> dsInsert) or
     (QMCondFamiliasFAMILIA.IsNull) then
     Exit;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPRESA FROM ART_CONDICIONES_PROV_FAM WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND PROVEEDOR = :PROVEEDOR AND FAMILIA = :FAMILIA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := QMCondFamiliasPROVEEDOR.Value;
        Params.ByName['FAMILIA'].AsString := QMCondFamiliasFamilia.Value;
        ExecQuery;
        Duplicado := (FieldByName['EMPRESA'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if Duplicado then
     raise Exception.Create(_('Clave duplicada'));
end;

procedure TDMCondicionesProv.QMCondArticulosBeforePost(DataSet: TDataSet);
begin
  ControlaDupArt;
end;

procedure TDMCondicionesProv.QMCondArticulosAfterCancel(DataSet: TDataSet);
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := QMCondArticulosARTICULO.AsString;
     Open;
  end;
end;

procedure TDMCondicionesProv.QMCondFamiliasAfterCancel(DataSet: TDataSet);
begin
  with xFamilias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAMILIA'].AsString := QMCondFamiliasFAMILIA.AsString;
     Open;
  end;
end;

procedure TDMCondicionesProv.QMCondFamiliasBeforePost(DataSet: TDataSet);
begin
  ControlaDupFam;
end;

end.
