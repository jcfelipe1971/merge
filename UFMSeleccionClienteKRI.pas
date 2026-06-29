unit UFMSeleccionClienteKRI;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados, Grids, DBGrids, NsDBGrid, StdCtrls, ULFEdit, ULFLabel, UFormGest;

type
  TFMSeleccionClienteKRI = class(TG2KForm)
     PNLCliente: TLFPanel;
     PNLContacto: TLFPanel;
     PNLDetCliente: TLFPanel;
     PNLDetContacto: TLFPanel;
     PNLCabCliente: TLFPanel;
     PNLCabContacto: TLFPanel;
     LCliente: TLFLabel;
     LContacto: TLFLabel;
     ECliente: TLFEdit;
     EContacto: TLFEdit;
     DBGCliente: TNsDBGrid;
     DBGContacto: TNsDBGrid;
     TLocal: THYTransaction;
     xContacto: TFIBDataSetRO;
     xCliente: TFIBDataSetRO;
     DSCliente: TDataSource;
     DSContacto: TDataSource;
     xClienteCLIENTE: TIntegerField;
     xClienteNOMBRE_R_SOCIAL: TFIBStringField;
     xClienteTERCERO: TIntegerField;
     xContactoCONTACTO: TIntegerField;
     xContactoCONCATENATION: TFIBStringField;
     PNLPie: TLFPanel;
     BOk: TButton;
     BCancel: TButton;
     procedure FormCreate(Sender: TObject);
     procedure EClienteChange(Sender: TObject);
     procedure xClienteAfterClose(DataSet: TDataSet);
     procedure xClienteAfterOpen(DataSet: TDataSet);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EClienteKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EContactoKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGClienteKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGContactoKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGClienteDblClick(Sender: TObject);
     procedure DBGContactoDblClick(Sender: TObject);
     procedure BCancelClick(Sender: TObject);
     procedure BOkClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Cliente: integer;
     Contacto: integer;
     ClienteOrigen: integer;
     ContactoOrigen: integer;
     procedure Mostrar(s: string; cli, con: integer);
  end;

var
  FMSeleccionClienteKRI : TFMSeleccionClienteKRI;

implementation

uses UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TFMSeleccionClienteKRI.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  PNLCliente.Height := (PNLCliente.Height + PNLContacto.Height) div 2;
  with xCliente do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT E.CLIENTE, T.NOMBRE_R_SOCIAL, E.TERCERO, E.AGENTE ');
        Add(' FROM EMP_CLIENTES E ');
        Add(' JOIN CON_CUENTAS_GES_CLI C ');
        Add(' ON C.EMPRESA = E.EMPRESA AND C.CLIENTE = E.CLIENTE ');
        Add(' JOIN SYS_TERCEROS T ');
        Add(' ON E.TERCERO = T.TERCERO ');
        Add(' WHERE E.EMPRESA = ?EMPRESA AND C.EJERCICIO = ?EJERCICIO AND C.CANAL = ?CANAL ');
        if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
           Add(' AND E.AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
        Add(' AND ((UPPER(cast(E.CLIENTE as varchar(60))) LIKE ?CLIENTE) OR (UPPER(T.NOMBRE_R_SOCIAL) LIKE ?CLIENTE)) ');
        Add(' AND E.BAJA = 0 ');
        Add(' ORDER BY CLIENTE ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsString := '%';
     Open;
  end;
  ECliente.Text := '';
end;

procedure TFMSeleccionClienteKRI.Mostrar(s: string; cli, con: integer);
begin
  ClienteOrigen := cli;
  ContactoOrigen := con;
  Cliente := ClienteOrigen;
  Contacto := ContactoOrigen;
  ECliente.Text := s;
  {Me posiciono al final del texto insertado}
  if (Length(s) > 0) then
     ECliente.SelStart := Length(s);
  ShowModal;
end;

procedure TFMSeleccionClienteKRI.EClienteChange(Sender: TObject);
begin
  with xCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Length(Trim(ECliente.Text)) > 0) then
        Params.ByName['CLIENTE'].AsString := UpperCase('%' + ECliente.Text + '%')
     else
        Params.ByName['CLIENTE'].AsString := '%';
     Open;
  end;
end;

procedure TFMSeleccionClienteKRI.xClienteAfterClose(DataSet: TDataSet);
begin
  xContacto.Close;
end;

procedure TFMSeleccionClienteKRI.xClienteAfterOpen(DataSet: TDataSet);
begin
  xContacto.Open;
end;

procedure TFMSeleccionClienteKRI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  xCliente.Close;
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TFMSeleccionClienteKRI.EClienteKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  case Key of
     VK_RETURN: BOk.Click;
     VK_DOWN: DBGCliente.SetFocus;
  end;
end;

procedure TFMSeleccionClienteKRI.EContactoKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  case Key of
     VK_RETURN: BOk.Click;
     VK_DOWN: DBGContacto.SetFocus;
  end;
end;

procedure TFMSeleccionClienteKRI.DBGClienteKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  case Key of
     VK_RETURN: BOk.Click;
     VK_TAB: DBGContacto.SetFocus;
  end;
end;

procedure TFMSeleccionClienteKRI.DBGContactoKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  case Key of
     VK_RETURN: BOk.Click;
     VK_TAB: BOk.SetFocus;
  end;
end;

procedure TFMSeleccionClienteKRI.DBGClienteDblClick(Sender: TObject);
begin
  BOk.Click;
end;

procedure TFMSeleccionClienteKRI.DBGContactoDblClick(Sender: TObject);
begin
  BOk.Click;
end;

procedure TFMSeleccionClienteKRI.BCancelClick(Sender: TObject);
begin
  Cliente := ClienteOrigen;
  Contacto := ContactoOrigen;
end;

procedure TFMSeleccionClienteKRI.BOkClick(Sender: TObject);
begin
  Cliente := xClienteCLIENTE.AsInteger;
  Contacto := xContactoCONTACTO.AsInteger;
end;

end.
