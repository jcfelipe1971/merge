unit UDMGenCanales;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, UComponentesBusquedaFiltrada, DB,
  FIBDataSet, FIBTableDataSet, FIBQuery, FIBDataSetRO, HYFIBQuery;

type
  TDMGenCanales = class(TDataModule)
     TLocal: THYTransaction;
     SPAsignarModoIva: THYFIBQuery;
     SPCopiarModoIVA: THYFIBQuery;
     QMGenCanales: TFIBTableSet;
     QMGenCanalesEMPRESA: TIntegerField;
     QMGenCanalesCANAL: TIntegerField;
     QMGenCanalesACTIVO: TIntegerField;
     QMGenCanalesPAIS: TFIBStringField;
     QMGenCanalesTIPO_IVA: TIntegerField;
     QMGenCanalesMONEDA: TFIBStringField;
     QMGenCanalesMODO_IVA: TIntegerField;
     QMGenCanalesTITULO: TFIBStringField;
     QMGenCanalesPERFIL: TFIBStringField;
     DSQMGenCanales: TDataSource;
     DSxTiposIVA: TDataSource;
     DSxModosIVA: TDataSource;
     SPLimEmpEjeCan: THYFIBQuery;
     EFIva: TEntornoFind2000;
     xTiposIva: TFIBDataSetRO;
     xModosIVA: TFIBDataSetRO;
     xTiposIvaTITULO: TFIBStringField;
     xTiposIvaP_IVA: TFloatField;
     xTiposIvaP_RECARGO: TFloatField;
     TUpdate: THYTransaction;
     QMGenCanalesCOLOR: TFloatField;
     procedure DMGenCanalesCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMGenCanalesAfterOpen(DataSet: TDataSet);
     procedure QMGenCanalesPAISChange(Sender: TField);
     procedure QMGenCanalesTIPO_IVAChange(Sender: TField);
     procedure QMGenCanalesMODO_IVAChange(Sender: TField);
     procedure QMGenCanalesBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CopiarModoIva(tipo: smallint);
     procedure AsignarModoIva(tipo: smallint);
     procedure ActivarCanal(Accion: smallint);
     procedure BusquedaComplejaCanales;
     procedure LimpiaCanTodo;
  end;

var
  DMGenCanales : TDMGenCanales;

implementation

uses UDMMain, UEntorno, uFBusca;

{$R *.DFM}

procedure TDMGenCanales.DMGenCanalesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xTiposIvaP_IVA.DisplayFormat := MascaraP;
  xTiposIvaP_RECARGO.DisplayFormat := MascaraP;

  DMMain.FiltraTabla(QMGenCanales, '10000', True);
  EFIva.Pais := REntorno.Pais;
end;

procedure TDMGenCanales.Graba(DataSet: TDataSet);
begin
  if QMGenCanalesCANAL.AsInteger = REntorno.Canal then
     REntorno.Perfil := QMGenCanalesPERFIL.AsString;

  REntorno.Moneda := QMGenCanalesMONEDA.AsString;
end;

procedure TDMGenCanales.QMGenCanalesAfterOpen(DataSet: TDataSet);
begin
  xTiposIVA.Open;
  xModosIVA.Open;
end;

procedure TDMGenCanales.QMGenCanalesPAISChange(Sender: TField);
begin
  EFIva.Pais := Sender.AsString;
end;

procedure TDMGenCanales.QMGenCanalesTIPO_IVAChange(Sender: TField);
begin
  with xTiposIva do
  begin
     Close;
     Open;
  end;
end;

procedure TDMGenCanales.QMGenCanalesMODO_IVAChange(Sender: TField);
begin
  with xModosIVA do
  begin
     Close;
     Open;
  end;
end;

procedure TDMGenCanales.BusquedaComplejaCanales;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMGenCanales, '10000');
end;

procedure TDMGenCanales.ActivarCanal(Accion: smallint);
begin
  //Accion (1-Activar, 0-Desactivar)
  with QMGenCanales do
  begin
     Edit;
     QMGenCanalesACTIVO.AsInteger := Accion;
     Post;
     Refresh;
  end;
end;

procedure TDMGenCanales.AsignarModoIva(tipo: smallint);
begin
  with SPAsignarModoIva do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := QMGenCanalesCANAL.AsInteger;
     Params.ByName['MODO_IVA'].AsInteger := QMGenCanalesMODO_IVA.AsInteger;
     Params.ByName['TIPO'].AsInteger := tipo;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMGenCanales.CopiarModoIva(tipo: smallint);
begin
  with SPCopiarModoIva do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL_ORIGEN'].AsInteger := QMGenCanalesCANAL.AsInteger;
     Params.ByName['CANAL_DESTINO'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsInteger := tipo;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMGenCanales.LimpiaCanTodo;
begin
  with SPLimEmpEjeCan do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := QMGenCanalesCANAL.AsInteger;
     ExecQuery;
     FreeHandle;
  end;
  ActivarCanal(0);

  QMGenCanales.Close;
  QMGenCanales.Open;
end;

procedure TDMGenCanales.QMGenCanalesBeforePost(DataSet: TDataSet);
begin
  if (QMGenCanalesCOLOR.AsFloat = 0) then
     QMGenCanalesCOLOR.AsFloat := clBtnFace;
end;

end.
