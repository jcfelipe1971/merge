unit UDMRelacionaAnticipo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBQuery, HYFIBQuery,
  FIBDataSetRO;

type
  TDMRelacionaAnticipo = class(TDataModule)
     DSxAnticiposRel: TDataSource;
     TLocal: THYTransaction;
     xAnticiposRel: TFIBDataSetRO;
     xAnticiposDisp: TFIBDataSetRO;
     DSxAnticiposDisp: TDataSource;
     QRelaciona: THYFIBQuery;
     QEliminaRelacion: THYFIBQuery;
     xArticulo: TFIBDataSetRO;
     DSxArticulo: TDataSource;
     xAnticiposDispRIG: TIntegerField;
     xAnticiposDispLINEA: TIntegerField;
     xAnticiposDispPRECIO: TFloatField;
     xAnticiposDispID_DETALLES_S: TIntegerField;
     xAnticiposDispRESTO_ANTICIPO: TFloatField;
     xAnticiposRelRIG: TIntegerField;
     xAnticiposRelLINEA: TIntegerField;
     xAnticiposRelIMPORTE_ANT: TFloatField;
     xAnticiposRelID_DETALLES_S: TIntegerField;
     xAnticiposDispEJERCICIO_R: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     IdDetallesS: integer;
     SaldoCta: double;
     LocalMascaraN: string;
     procedure AsignaMascaras;
  public
     { Public declarations }
     Cliente: integer;
     function DameSaldoCtaAnticipo(Cliente: integer): double;
     procedure AbrirAnticiposRel;
     procedure AbrirAnticiposDisp;
     procedure Relaciona(Total_Linea: double);
     procedure EliminaRelacion;
     procedure AbreDatos(IdDetallesS: integer);
     procedure RefrescaDatos;
     function ValidaTotalAnticipos(Total_Anticipo: double): boolean;
     procedure BorraAnticipos;
  end;

var
  DMRelacionaAnticipo : TDMRelacionaAnticipo;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno;

procedure TDMRelacionaAnticipo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaMascaras;
end;

function TDMRelacionaAnticipo.DameSaldoCtaAnticipo(Cliente: integer): double;
var
  Moneda : string;
begin
  DMMain.SaldoAnticipo('CLI', Cliente, REntorno.FechaTrabSH, SaldoCta, Moneda);
  Result := SaldoCta;
end;

procedure TDMRelacionaAnticipo.AbrirAnticiposRel;
begin
  with xAnticiposRel do
  begin
     Close;
     Params.ByName['ID_DETALLES_S'].AsInteger := IdDetallesS;
     Open;
  end;
end;

procedure TDMRelacionaAnticipo.AbrirAnticiposDisp;
begin
  with xAnticiposDisp do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['ID_D_S'].AsInteger := IdDetallesS;
     Open;
  end;
end;

procedure TDMRelacionaAnticipo.Relaciona(Total_Linea: double);
var
  Q : THYFIBQuery;
begin
  if (xAnticiposDisp.RecordCount > 0) then
     Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_CREA_RELACION_ANTICIPO (?SALDO_CTA, ?O_ID_DETALLES_S, ?D_ID_DETALLES_S, ?TOTAL_LINEA)';
        Params.ByName['SALDO_CTA'].AsFloat := SaldoCta;
        Params.ByName['O_ID_DETALLES_S'].AsInteger := xAnticiposDispID_DETALLES_S.AsInteger;
        Params.ByName['D_ID_DETALLES_S'].AsInteger := IdDetallesS;
        Params.ByName['TOTAL_LINEA'].AsFloat := Total_Linea;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMRelacionaAnticipo.EliminaRelacion;
var
  Q : THYFIBQuery;
begin
  if (xAnticiposRel.RecordCount > 0) then
     Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM GES_DETALLES_RELACIONES_ANT ');
        SQL.Add(' WHERE ');
        SQL.Add(' O_ID_DETALLES_S = ?O_ID_DETALLES_S AND ');
        SQL.Add(' D_ID_DETALLES_S = ?D_ID_DETALLES_S ');
        Params.ByName['O_ID_DETALLES_S'].AsInteger := xAnticiposRelID_DETALLES_S.AsInteger;
        Params.ByName['D_ID_DETALLES_S'].AsInteger := IdDetallesS;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMRelacionaAnticipo.AbreDatos(IdDetallesS: integer);
begin
  Self.IdDetallesS := IdDetallesS;

  with xArticulo do
  begin
     Close;
     Params.ByName['ID_DETALLES_S'].AsInteger := IdDetallesS;
     Open;
  end;

  AbrirAnticiposRel;
  AbrirAnticiposDisp;
end;

procedure TDMRelacionaAnticipo.RefrescaDatos;
begin
  AbrirAnticiposRel;
  AbrirAnticiposDisp;
end;

function TDMRelacionaAnticipo.ValidaTotalAnticipos(Total_Anticipo: double): boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT SUM(IMPORTE_ANT) AS IMPORTE_TOTAL FROM GES_DETALLES_RELACIONES_ANT WHERE D_ID_DETALLES_S = ?ID_DETALLES_S';
     Params.ByName['ID_DETALLES_S'].AsInteger := iddetalless;
     ExecQuery;
     Result := (Total_Anticipo = FieldByName['IMPORTE_TOTAL'].AsFloat);
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMRelacionaAnticipo.BorraAnticipos;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        Database := DMMain.DataBase;
        SQL.Text := 'DELETE FROM GES_DETALLES_RELACIONES_ANT WHERE D_ID_DETALLES_S = ?ID_DETALLES_S';
        Params.ByName['ID_DETALLES_S'].AsInteger := iddetalless;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMRelacionaAnticipo.AsignaMascaras;
var
  Q : THYFIBQuery;
  Moneda : string;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     Database := DMMain.DataBase;
     SQL.Add(' SELECT CAB.MONEDA FROM GES_CABECERAS_S CAB ');
     SQL.Add(' JOIN GES_DETALLES_S DET ');
     SQL.Add(' ON (CAB.ID_S = DET.ID_S) ');
     SQL.Add(' WHERE DET.ID_DETALLES_S = ?ID_DETALLES_S ');
     Params.ByName['ID_DETALLES_S'].AsInteger := iddetalless;
     ExecQuery;
     Moneda := FieldByName['MONEDA'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  xAnticiposRelIMPORTE_ANT.DisplayFormat := LocalMascaraN;
  xAnticiposDispPRECIO.DisplayFormat := LocalMascaraN;
end;

end.
