unit UFPregPropPedidos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ComCtrls, ToolWin, ExtCtrls, UFormGest, ULFLabel, ULFPanel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFPageControl, ULFToolBar,
  UFPEditListado, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList;

type
  TFPregPropPedidos = class(TFPEditListado)
     TSFamilia: TTabSheet;
     TSProveedor: TTabSheet;
     GBFamilia: TGroupBox;
     LDesdeFamilia: TLFLabel;
     EFDesdeFam: TEditFind2000;
     LHastaFamilia: TLFLabel;
     EFHastaFam: TEditFind2000;
     GBAlmacenFamilia: TGroupBox;
     LDesdeAlmacenFam: TLFLabel;
     EFDesdeAlmFam: TEditFind2000;
     LHastaAlmacenFam: TLFLabel;
     EFHastaAlmFam: TEditFind2000;
     GBAlmacenProveedor: TGroupBox;
     LDesdeAlmacenProv: TLFLabel;
     LHastaAlmacenProv: TLFLabel;
     EFDesdeAlmProv: TEditFind2000;
     EFHastaAlmProv: TEditFind2000;
     GBProveedor: TGroupBox;
     LDesdeProveedor: TLFLabel;
     LHastaProveedor: TLFLabel;
     EFDesdeProv: TEditFind2000;
     EFHastaProv: TEditFind2000;
     CBTodosLosAlmFam: TLFCheckBox;
     CBTodosLosAlmProv: TLFCheckBox;
     TButtConfigurar: TToolButton;
     procedure CBTodosLosAlmFamClick(Sender: TObject);
     procedure CBTodosLosAlmProvClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
     function DameGrupo: integer;
     procedure Imprimir(Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregPropPedidos : TFPregPropPedidos;

implementation

uses UDMMain, UEntorno, UDMLstPropPedidos, HYFIBQuery, UUtiles;

{$R *.dfm}

procedure TFPregPropPedidos.CBTodosLosAlmFamClick(Sender: TObject);
var
  Min, Max : string;
begin
  inherited;

  if (CBTodosLosAlmFam.Checked) then
  begin
     EFDesdeAlmFam.Text := '';
     EFHastaAlmFam.Text := '';
     EFDesdeAlmFam.Enabled := False;
     EFHastaAlmFam.Enabled := False;
  end
  else
  begin
     EFDesdeAlmFam.Enabled := True;
     EFHastaAlmFam.Enabled := True;

     DameMinMax('ALM', Min, Max);
     EFDesdeAlmFam.Text := Min;
     EFHastaAlmFam.Text := Max;
  end;
end;

procedure TFPregPropPedidos.CBTodosLosAlmProvClick(Sender: TObject);
var
  Min, Max : string;
begin
  if (CBTodosLosAlmProv.Checked) then
  begin
     EFDesdeAlmProv.Text := '';
     EFHastaAlmProv.Text := '';
     EFDesdeAlmProv.Enabled := False;
     EFHastaAlmProv.Enabled := False;
  end
  else
  begin
     EFDesdeAlmProv.Enabled := True;
     EFHastaAlmProv.Enabled := True;

     DameMinMax('ALM', Min, Max);
     EFDesdeAlmProv.Text := Min;
     EFHastaAlmProv.Text := Max;
  end;
end;

procedure TFPregPropPedidos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstPropPedidos, DMLstPropPedidos);
  ARecargar.Execute;
  Grupo := 5500;  // 5500-5503
  Listado := DMLstPropPedidos.frPropuestaDePedido;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := nil;
end;

procedure TFPregPropPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPregPropPedidos.Imprimir(Modo: integer);
begin
  Grupo := DameGrupo;

  if (PCMain.ActivePage = TSFamilia) then
     DMLstPropPedidos.Imprimir(Grupo, Modo, StrToInt(EFDesdeProv.Text), StrToInt(EFHastaProv.Text), EFDesdeFam.Text, EFHastaFam.Text, EFDesdeAlmFam.Text, EFHastaAlmFam.Text);

  if (PCMain.ActivePage = TSProveedor) then
     DMLstPropPedidos.Imprimir(Grupo, Modo, StrToInt(EFDesdeProv.Text), StrToInt(EFHastaProv.Text), EFDesdeFam.Text, EFHastaFam.Text, EFDesdeAlmProv.Text, EFHastaAlmProv.Text);
end;

procedure TFPregPropPedidos.ARecargarExecute(Sender: TObject);
var
  Min, Max : string;
begin
  inherited;
  DameMinMax('FAM', Min, Max);
  EFDesdeFam.Text := Min;
  EFHastaFam.Text := Max;

  DameMinMax('PRO', Min, Max);
  EFDesdeProv.Text := Min;
  EFHastaProv.Text := Max;

  DameMinMax('ALM', Min, Max);
  EFDesdeAlmFam.Text := Min;
  EFHastaAlmFam.Text := Max;
  EFDesdeAlmProv.Text := Min;
  EFHastaAlmProv.Text := Max;

  CBTodosLosAlmFam.Checked := False;
  CBTodosLosAlmProv.Checked := False;
end;

procedure TFPregPropPedidos.AImprimirExecute(Sender: TObject);
begin
  inherited;
  Imprimir(1);
end;

procedure TFPregPropPedidos.APrevExecute(Sender: TObject);
begin
  inherited;
  Imprimir(0);
end;

function TFPregPropPedidos.DameGrupo: integer;
begin
  Result := 0;

  if (PCMain.ActivePage = TSFamilia) then
  begin
     if (CBTodosLosAlmFam.Checked) then
        Result := 5503
     else
        Result := 5500;
  end;

  if (PCMain.ActivePage = TSProveedor) then
  begin
     if (CBTodosLosAlmProv.Checked) then
        Result := 5502
     else
        Result := 5501;
  end;
end;

procedure TFPregPropPedidos.AConfigurarExecute(Sender: TObject);
begin
  Grupo := DameGrupo;

  inherited;
end;

end.
