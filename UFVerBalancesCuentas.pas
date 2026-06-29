unit UFVerBalancesCuentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, ExtCtrls, Grids, DBGrids, UHYDBGrid,
  StdCtrls, Mask, DBCtrls, Buttons, UControlEdit, UFormGest, FIBDataSetRO,
  FIBTableDataSetRO, FIBDatabase, UFIBModificados, NsDBGrid,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UEditPanel, ToolWin, ComCtrls, ULFToolBar, ULFPanel;

type
  TFVerBalancesCuentas = class(TFPEditSinNavegador)
     DBGMain: THYTDBGrid;
     xVerBalancesCuentas: TFIBTableSetRO;
     DSxVerBalancesCuentas: TDataSource;
     xVerBalancesCuentasCUENTA: TFIBStringField;
     xVerBalancesCuentasTITULO: TFIBStringField;
     xVerBalancesCuentasANTERIOR: TFloatField;
     xVerBalancesCuentasACTUAL: TFloatField;
     TLocal: THYTransaction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGMainKeyPress(Sender: TObject; var Key: char);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
     LocalMascaraN: string;
     // LocalMascaraL : string;
  public
     { Public declarations }
     Moneda: string;
  end;

var
  FVerBalancesCuentas : TFVerBalancesCuentas;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TFVerBalancesCuentas.FormCreate(Sender: TObject);
begin
  inherited;
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TFVerBalancesCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFVerBalancesCuentas.DBGMainKeyPress(Sender: TObject; var Key: char);
begin
  if ((Key = #13) or (Key = #27)) then
     Self.Close;
end;

procedure TFVerBalancesCuentas.FormShow(Sender: TObject);
begin
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  // LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  xVerBalancesCuentasANTERIOR.DisplayFormat := LocalMascaraN;
  xVerBalancesCuentasACTUAL.DisplayFormat := LocalMascaraN;

  xVerBalancesCuentas.Close;
  DBGMain.DataSource := DSxVerBalancesCuentas;
  xVerBalancesCuentas.Open;
end;

end.
