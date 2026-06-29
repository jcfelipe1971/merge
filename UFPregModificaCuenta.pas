unit UFPregModificaCuenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ULFPanel, ToolWin, ULFToolBar, UEditPanel,
  Mask, DBCtrls, ULFDBEdit, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel,
  ULFDBEditFind2000, ULFEdit, UFPEditSimple, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList, Menus, UTeclas, UControlEdit, UNavigator,
  UFPEditSinNavegador;

type
  TFPregModificaCuenta = class(TFPEditSinNavegador)
     TButtConfirmar: TToolButton;
     LCuenta: TLFLabel;
     EFCuenta: TLFEditFind2000;
     ETituloCuenta: TLFEdit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TButtConfirmarClick(Sender: TObject);
     procedure EFCuentaChange(Sender: TObject);
     procedure EFCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
  public
     { Public declarations }
     Cuenta: string;
     Pgc: integer;
     procedure EjecutaModificaCuenta(aCuenta: string);
     procedure Expande;
  end;

var
  FPregModificaCuenta : TFPregModificaCuenta;

implementation

uses UDMMain, UEntorno, UDMMovConta, UUtiles, UFMain, HYFIBQuery, UDameDato;

{$R *.dfm}

procedure TFPregModificaCuenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMain.DelComponentePunto(EFCuenta);
  Action := caFree;
end;

procedure TFPregModificaCuenta.FormCreate(Sender: TObject);
begin
  // Controlamos la longitud de la cadena
  EFCuenta.MaxLength := REntorno.DigitosSub;

  FMain.AddComponentePunto(EFCuenta);
  Pgc := DMMovConta.DameCuentaPgc;
  Cuenta := DMMovConta.DameCuenta;
end;

procedure TFPregModificaCuenta.EjecutaModificaCuenta(aCuenta: string);
begin
  EFCuenta.Text := aCuenta;
  ShowModal;
end;

procedure TFPregModificaCuenta.TButtConfirmarClick(Sender: TObject);
begin
  Cuenta := Trim(EFCuenta.Text);

  // Verifico que exista, que sea de ultimo nivel y que sea de Perdida o Ganancia.
  if ((DameTituloCuenta(Cuenta) <> '') and (Length(Cuenta) = REntorno.DigitosSub) and (not DMMovConta.CuentaCierre(Cuenta))) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE CON_CUENTAS_APUNTES ');
           SQL.Add(' SET ');
           SQL.Add(' CUENTA = ?CUENTA, ');
           SQL.Add(' ENTRADA = ?ENTRADA ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' RIC = ?RIC AND ');
           SQL.Add(' LINEA = ?LINEA ');
           Params.ByName['EMPRESA'].AsInteger := DMMovConta.QMApuntesEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := DMMovConta.QMApuntesEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := DMMovConta.QMApuntesCANAL.AsInteger;
           Params.ByName['RIC'].AsInteger := DMMovConta.QMApuntesRIC.AsInteger;
           Params.ByName['LINEA'].AsInteger := DMMovConta.QMApuntesLINEA.AsInteger;
           Params.ByName['CUENTA'].AsString := Cuenta;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ModalResult := mrOk;
     DMMovConta.RefrescaApunte;
  end
  else
  begin
     ShowMessage('La cuenta no existe');
     ModalResult := mrNone;
  end;
end;

procedure TFPregModificaCuenta.EFCuentaChange(Sender: TObject);
begin
  ETituloCuenta.Text := DameTituloCuenta(Cuenta);
end;

procedure TFPregModificaCuenta.EFCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     Expande;
end;

procedure TFPregModificaCuenta.Expande;
begin
  if Pos('.', EFCuenta.Text) <> 0 then
     EFCuenta.Text := ExpandirCadena(EFCuenta.Text, REntorno.DigitosSub);
end;

end.
