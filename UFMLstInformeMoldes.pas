unit UFMLstInformeMoldes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, Mask, rxToolEdit, StdCtrls,
  ExtCtrls, ComCtrls, ToolWin, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFActionList, ULFComboBox, ULFEdit,
  ULFPanel, ULFPageControl, ULFToolBar, ULFDBEdit, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage;

type
  TFMLstInformeMoldes = class(TFPEditListadoSfg)
     GBMoldes: TGroupBox;
     LblMolde: TLFLabel;
     EFMolde: TLFEditFind2000;
     EFDescMolde: TLFEdit;
     LFLinea: TLFEditFind2000;
     LFDescLinea: TLFEdit;
     CBLinea: TLFCheckBox;
     procedure EFMoldeChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure CBLineaChange(Sender: TObject);
     procedure LFLineaBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMLstInformeMoldes : TFMLstInformeMoldes;

implementation

uses UDMMain, UDMLstInformeMoldes, UFormGest, UEntorno;

{$R *.dfm}

procedure TFMLstInformeMoldes.EFMoldeChange(Sender: TObject);
begin
  inherited;
  EFDescMolde.Text := DMLstInformeMoldes.BuscaDesc('EMP_MOLDES', EFMolde.Text, '');
  LFDescLinea.Text := DMLstInformeMoldes.BuscaDesc('EMP_MOLDES_REPARACIONES', EFMolde.Text, LFLinea.Text);
end;

procedure TFMLstInformeMoldes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstInformeMoldes, DMLstInformeMoldes);
  ARecargar.Execute;

  Listado := DMLstInformeMoldes.frListadoN;
  Grupo := 9004;
end;

procedure TFMLstInformeMoldes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstInformeMoldes);
end;

procedure TFMLstInformeMoldes.ARecargarExecute(Sender: TObject);
begin
  inherited;
  EFDescMolde.Text := ' ';
  EFMolde.Text := '0';
end;

procedure TFMLstInformeMoldes.APrevExecute(Sender: TObject);
begin
  inherited;
  if (LFLinea.Text = '') then
     LFLinea.Text := '0';
  DMLstInformeMoldes.MostrarListado(grupo, StrToInt(EFMolde.Text), StrToInt(LFLinea.Text), 0, EComentario.Text, TDPFechaListado.Date);
end;

procedure TFMLstInformeMoldes.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMLstInformeMoldes.MostrarListado(grupo, StrToInt(EFMolde.Text), StrToInt(LFLinea.Text), 1, EComentario.Text, TDPFechaListado.Date);
end;

procedure TFMLstInformeMoldes.CBLineaChange(Sender: TObject);
begin
  inherited;
  if (CBLinea.State = cbUnchecked) then
  begin
     DMLstInformeMoldes.UtilizaLinea := 0;
     LFLinea.ReadOnly := True;
     LFLinea.Color := clInfoBk;
  end
  else
  begin
     DMLstInformeMoldes.UtilizaLinea := 1;
     LFLinea.ReadOnly := False;
     LFLinea.Color := clWindow;
  end;
end;

procedure TFMLstInformeMoldes.LFLineaBusqueda(Sender: TObject);
begin
  inherited;
  if Trim(LFLinea.Tabla_A_Buscar) = 'EMP_MOLDES_REPARACIONES' then
     LFLinea.CondicionBusqueda := 'NUM_MOLDE ="' + EFMolde.Text + '"';
end;

end.
