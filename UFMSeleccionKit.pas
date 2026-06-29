unit UFMSeleccionKit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, ULFEdit, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  UEditPanel, ToolWin, ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, HYFIBQuery, UEntorno;

type
  TFMSeleccionKit = class(TFPEditSinNavegador)
     LRefProveedor: TLFLabel;
     EFModelo: TLFEditFind2000;
     ETituloModelo: TLFEdit;
     LModelo: TLFLabel;
     LColor: TLFLabel;
     EFColor: TLFEditFind2000;
     ETituloColor: TLFEdit;
     LKit: TLFLabel;
     EFKit: TLFEditFind2000;
     ETituloKit: TLFEdit;
     ECantidad: TLFEdit;
     LCantidad: TLFLabel;
     TButtOk: TToolButton;
     TButtCancelar: TToolButton;
     procedure EFModeloChange(Sender: TObject);
     procedure EFColorBusqueda(Sender: TObject);
     procedure EFColorChange(Sender: TObject);
     procedure EFKitBusqueda(Sender: TObject);
     procedure EFKitChange(Sender: TObject);
     procedure TButtOkClick(Sender: TObject);
     procedure TButtCancelarClick(Sender: TObject);
  private
     { Private declarations }
     function DameIdModelo(RefProveedor: string): integer;
     function DameIdColor(CodColor: string): integer;
     function DameIdKit(Kit: string): integer;
     function DameTituloModelo(id_a_m: integer): string;
     (*
     function DameReferenciaProveedorModelo(id_a_m: integer): string;
     function DameTituloModeloColor(ID_A_M_C: integer): string;
     *)
     function DameTituloColor(id_a_c: integer): string;
     function DameTituloKit(ID_A_K: integer): string;
  public
     { Public declarations }
  end;

var
  FMSeleccionKit : TFMSeleccionKit;

function PideDato(var id_a_m, id_a_c, id_kit: integer; var Cantidad: double): boolean;

implementation

uses UDMMain, UFormGest;

{$R *.dfm}

function PideDato(var id_a_m, id_a_c, id_kit: integer; var Cantidad: double): boolean;
begin
  AbreForm(TFMSeleccionKit, FMSeleccionKit);
  try
     with FMSeleccionKit do
     begin
        // Poner ids y cantidad en editfinds.
        if (id_a_m <> 0) then
           EFModelo.Text := IntToStr(id_a_m);
        if (id_a_c <> 0) then
           EFColor.Text := IntToStr(id_a_c);
        if (id_kit <> 0) then
           EFKit.Text := IntToStr(id_kit);
        ECantidad.Text := FloatToStr(Cantidad);

        // Oculto para mostrar en modo Modal
        Hide;
        ShowModal;

        if (ModalResult = mrOk) then
        begin
           Result := True;
           id_a_m := DameIdModelo(EFModelo.Text);
           id_a_c := DameIdColor(EFColor.Text);
           id_kit := DameIdKit(EFKit.Text);
           Cantidad := StrToFloat(StringReplace(ECantidad.Text, ThousandSeparator, '', [rfReplaceAll]));
        end
        else
           Result := False;
     end;
  finally
     CierraForm(FMSeleccionKit);
  end;
end;

function TFMSeleccionKit.DameIdModelo(RefProveedor: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_A_M FROM ART_ARTICULOS_MODELOS WHERE EMPRESA = :EMPRESA AND REF_PROVEEDOR = :REF_PROVEEDOR';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['REF_PROVEEDOR'].AsString := RefProveedor;
        ExecQuery;
        Result := FieldByName['ID_A_M'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TFMSeleccionKit.DameTituloModelo(id_a_m: integer): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM ART_ARTICULOS_MODELOS WHERE ID_A_M = :ID_A_M';
        Params.ByName['ID_A_M'].AsInteger := id_a_m;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

(*
function TFMSeleccionKit.DameReferenciaProveedorModelo(id_a_m: integer): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT REF_PROVEEDOR FROM ART_ARTICULOS_MODELOS WHERE ID_A_M = :ID_A_M';
        Params.ByName['ID_A_M'].AsInteger := id_a_m;
        ExecQuery;
        Result := FieldByName['REF_PROVEEDOR'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;
*)

procedure TFMSeleccionKit.EFModeloChange(Sender: TObject);
begin
  inherited;
  ETituloModelo.Text := DameTituloModelo(DameIdModelo(EFModelo.Text));
  EFColor.Text := '';
  EFKit.Text := '';
end;

procedure TFMSeleccionKit.EFColorBusqueda(Sender: TObject);
begin
  inherited;
  EFColor.CondicionBusqueda := 'ID_A_C IN (SELECT ID_A_C FROM ART_ARTICULOS_MOD_COLOR WHERE ID_A_M = ' + IntToStr(DameIdModelo(EFModelo.Text)) + ')';
end;

(*
function TFMSeleccionKit.DameTituloModeloColor(ID_A_M_C: integer): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM ART_ARTICULOS_MOD_COLOR WHERE ID_A_M_C = :ID_A_M_C';
        Params.ByName['ID_A_M_C'].AsInteger := ID_A_M_C;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;
*)

procedure TFMSeleccionKit.EFColorChange(Sender: TObject);
begin
  inherited;
  ETituloColor.Text := DameTituloColor(DameIdColor(EFColor.Text));
end;

procedure TFMSeleccionKit.EFKitBusqueda(Sender: TObject);
begin
  inherited;
  EFKit.CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr + ' AND ID_G_T = (SELECT ID_G_T FROM ART_ARTICULOS_MODELOS WHERE ID_A_M = ' + IntToStr(DameIdModelo(EFModelo.Text)) + ')';
end;

procedure TFMSeleccionKit.EFKitChange(Sender: TObject);
begin
  inherited;
  ETituloKit.Text := DameTituloKit(DameIdKit(EFKit.Text));
end;

function TFMSeleccionKit.DameTituloKit(ID_A_K: integer): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM ART_KIT WHERE ID_A_K = :ID_A_K';
        Params.ByName['ID_A_K'].AsInteger := ID_A_K;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMSeleccionKit.TButtOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFMSeleccionKit.TButtCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

function TFMSeleccionKit.DameTituloColor(id_a_c: integer): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM ART_COLORES WHERE ID_A_C = :ID_A_C';
        Params.ByName['ID_A_C'].AsInteger := ID_A_C;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TFMSeleccionKit.DameIdColor(CodColor: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_A_C FROM ART_COLORES WHERE COD_COLOR = :COD_COLOR';
        Params.ByName['COD_COLOR'].AsString := CodColor;
        ExecQuery;
        Result := FieldByName['ID_A_C'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TFMSeleccionKit.DameIdKit(Kit: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_A_K FROM ART_KIT WHERE EMPRESA = :EMPRESA AND KIT = :KIT';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['KIT'].AsString := Kit;
        ExecQuery;
        Result := FieldByName['ID_A_K'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
