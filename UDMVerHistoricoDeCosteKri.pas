unit UDMVerHistoricoDeCosteKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados, HYFIBQuery;

type
  TDMVerHistoricoDeCosteKri = class(TDataModule)
     TLocal: THYTransaction;
     xVerHistoricoCostes: TFIBDataSetRO;
     DSxVerHistoricoCostes: TDataSource;
     xVerHistoricoCostesEMPRESA: TIntegerField;
     xVerHistoricoCostesEJERCICIO: TIntegerField;
     xVerHistoricoCostesCANAL: TIntegerField;
     xVerHistoricoCostesSERIE: TFIBStringField;
     xVerHistoricoCostesFECHA: TDateTimeField;
     xVerHistoricoCostesCOD_ART: TFIBStringField;
     xVerHistoricoCostesARTICULO: TFIBStringField;
     xVerHistoricoCostesCOD_PROV: TIntegerField;
     xVerHistoricoCostesPROVEEDOR: TFIBStringField;
     xVerHistoricoCostesCOSTE: TFloatField;
     xVerHistoricoCostesDESCUENTO1: TFloatField;
     xVerHistoricoCostesDESCUENTO2: TFloatField;
     xVerHistoricoCostesDESCUENTO3: TFloatField;
     xVerHistoricoCostesCON_DESCUENTO: TFloatField;
     xVerHistoricoCostesENTRADA: TIntegerField;
     xVerHistoricoCostesUSUARIO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Inicializa(Articulo: string);
  end;

var
  DMVerHistoricoDeCosteKri : TDMVerHistoricoDeCosteKri;

implementation

uses UEntorno, UDMMain, UDameDato;

{$R *.dfm}

procedure TDMVerHistoricoDeCosteKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  xVerHistoricoCostesCOSTE.DisplayFormat := ',0.00';
  xVerHistoricoCostesDESCUENTO1.DisplayFormat := MascaraP;
  xVerHistoricoCostesDESCUENTO2.DisplayFormat := MascaraP;
  xVerHistoricoCostesDESCUENTO3.DisplayFormat := MascaraP;
  xVerHistoricoCostesCON_DESCUENTO.DisplayFormat := ',0.00';
end;

procedure TDMVerHistoricoDeCosteKri.Inicializa(Articulo: string);
var
  ID_A : integer;
begin
  ID_A := DameIDArticulo(Articulo);
  with xVerHistoricoCostes do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM VER_HISTORICO_DE_COSTES_KRI ');
     SelectSQL.Add('WHERE ');
     SelectSQL.Add('(EMPRESA=' + REntorno.EmpresaStr + ') AND ');
     SelectSQL.Add('((EJERCICIO = ' + REntorno.EjercicioStr + ') OR (EJERCICIO = ' +
        IntToStr(REntorno.Ejercicio - 1) + ')) AND ');
     SelectSQL.Add('(CANAL = ' + REntorno.CanalStr + ') AND ');
     SelectSQL.Add('(ID_A = ''' + IntToStr(ID_A) + ''') ');
     SelectSQL.Add('ORDER BY FECHA DESC,PROVEEDOR ASC');
     Open;
  end;
end;

end.
