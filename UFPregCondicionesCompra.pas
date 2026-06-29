unit UFPregCondicionesCompra;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, UEntorno, UFormGest,
  Grids, DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, ExtCtrls, UFMCondicionesVenta, StrUtils, ULFActionList, dateutils,
  ULFPageControl, ULFToolBar, ULFComboBox, ULFCheckBox, ULFEditFind2000,
  UFMCondicionesCompra,
  ULFPanel, TFlatCheckBoxUnit, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFPregCondicionesCompra = class(TFPEditListadoSimple)
     EFDesdeCondProv: TLFEditFind2000;
     LDesdeCondProv: TLFLabel;
     LHastaCondProv: TLFLabel;
     EFHastaCondProv: TLFEditFind2000;
     EFHastaCondProvArt: TLFEditFind2000;
     LDesdeCondProvArt: TLFLabel;
     EFDesdeCondProvArt: TLFEditFind2000;
     LHastaCondProvArt: TLFLabel;
     EFHastaCondProvFam: TLFEditFind2000;
     LDesdeCondProvFam: TLFLabel;
     EFDesdeCondProvFam: TLFEditFind2000;
     LHastaCondProvFam: TLFLabel;
     CBProvArt: TLFCheckBox;
     CBProvFam: TLFCheckBox;
     CBProvAgrArt: TLFCheckBox;
     LDesdeCondProvAgrArt: TLFLabel;
     LHastaCondProvAgrArt: TLFLabel;
     EFHastaCondProvAgrArt: TLFEditFind2000;
     EFDesdeCondProvAgrArt: TLFEditFind2000;
     PNLLimites: TLFPanel;
     AConfRapida: TAction;
     TButtConfRapida: TToolButton;
     procedure AImprimirExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure CBProvArtClick(Sender: TObject);
     procedure CBProvFamClick(Sender: TObject);
     procedure Info_Cond;
     procedure borrar_parametros;
     procedure habilitar_btonsImpr;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure inicializar_checks;
     procedure CBProvAgrArtClick(Sender: TObject);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure EFDesdeCondProvArtBusqueda(Sender: TObject);
     procedure EFHastaCondProvArtBusqueda(Sender: TObject);
     procedure EFDesdeCondProvFamBusqueda(Sender: TObject);
     procedure EFHastaCondProvFamBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Heredar(Elemento: string);
  end;

var
  FPregCondicionesCompra : TFPregCondicionesCompra;
  FMCondicionesCompra : TFMCondicionesCompra;

implementation

uses UDMListados, UDMMain, UDMLstCondicionesCompra, UFMListConfig;

{$R *.dfm}

procedure TFPregCondicionesCompra.AImprimirExecute(Sender: TObject);
begin
  Info_Cond;
  DMLstCondicionesCompra.filtrarTabla(1);
end;

procedure TFPregCondicionesCompra.FormCreate(Sender: TObject);
begin
  inherited;

  inicializar_checks;

  DMLstCondicionesCompra.Rango(1);
  EFDesdeCondProv.Text := DMLstCondicionesCompra.minimo;
  EFHastaCondProv.Text := DMLstCondicionesCompra.maximo;
end;

procedure TFPregCondicionesCompra.ARecargarExecute(Sender: TObject);
begin
  inherited;
  inicializar_checks;
  DMLstCondicionesCompra.Rango(1);
  EFDesdeCondProv.Text := DMLstCondicionesCompra.minimo;
  EFHastaCondProv.Text := DMLstCondicionesCompra.maximo;
end;

procedure TFPregCondicionesCompra.CBProvArtClick(Sender: TObject);
begin
  inherited;
  if (CBProvArt.Checked) then
  begin
     LDesdeCondProvArt.Enabled := True;
     LHastaCondProvArt.Enabled := True;
     EFDesdeCondProvArt.Enabled := True;
     EFHastaCondProvArt.Enabled := True;
  end
  else
  begin
     LDesdeCondProvArt.Enabled := False;
     LHastaCondProvArt.Enabled := False;
     EFDesdeCondProvArt.Enabled := False;
     EFHastaCondProvArt.Enabled := False;
  end;
  DMLstCondicionesCompra.Rango(2);
  EFDesdeCondProvArt.Text := DMLstCondicionesCompra.minimo;
  EFHastaCondProvArt.Text := DMLstCondicionesCompra.maximo;
  habilitar_btonsImpr();
end;

procedure TFPregCondicionesCompra.CBProvFamClick(Sender: TObject);
begin
  inherited;
  if (CBProvFam.Checked) then
  begin
     LDesdeCondProvFam.Enabled := True;
     LHastaCondProvFam.Enabled := True;
     EFDesdeCondProvFam.Enabled := True;
     EFHastaCondProvFam.Enabled := True;
  end
  else
  begin
     LDesdeCondProvFam.Enabled := False;
     LHastaCondProvFam.Enabled := False;
     EFDesdeCondProvFam.Enabled := False;
     EFHastaCondProvFam.Enabled := False;
  end;
  DMLstCondicionesCompra.Rango(3);
  EFDesdeCondProvFam.Text := DMLstCondicionesCompra.minimo;
  EFHastaCondProvFam.Text := DMLstCondicionesCompra.maximo;
  habilitar_btonsImpr();
end;

//******************************************************************

procedure TFPregCondicionesCompra.inicializar_checks;
var
  j : integer;
  CB : TLFCheckBox;
begin
  with FPregCondicionesCompra do
     for j := 0 to ComponentCount - 1 do
        if (Components[j] is TLFCheckBox) then
        begin
           CB := TLFCheckBox(Components[j]);
           CB.Checked := False;
           CB.OnClick(Self);
        end;
  habilitar_btonsImpr();
end;

procedure TFPregCondicionesCompra.Heredar(Elemento: string);
begin
  if (Elemento <> '') then
  begin
     EFDesdeCondProv.Text := Elemento;
     EFHastaCondProv.Text := Elemento;
  end;

  Hide;
  ShowModal;
end;

procedure TFPregCondicionesCompra.Info_Cond;
//var i:integer;
begin
  with DMLstCondicionesCompra do
  begin
     QMxCabecera.Close;
     borrar_parametros;

     QMxCabecera.SelectSQL.Clear;
     QMxCabecera.SelectSQL.Add('SELECT * FROM VER_COND_COM_C ');
     QMxCabecera.SelectSQL.Add('WHERE (EMPRESA=?EMPRESA');
     QMxCabecera.SelectSQL.Add(' AND EJERCICIO=?EJERCICIO');
     QMxCabecera.SelectSQL.Add('AND CANAL=?CANAL) ');

     if (CBProvArt.Checked) then
     begin
        QMxCabecera.SelectSQL.Add('AND ((PROVEEDOR BETWEEN ' +
           (EFDesdeCondProv.Text) + ' AND ' + (EFHastaCondProv.Text) + ') ');
        QMxCabecera.SelectSQL.Add('AND (TIPO=''' + 'PRA''' + ' ');
        QMxCabecera.SelectSQL.Add('AND ARTICULO BETWEEN ''' +
           (EFDesdeCondProvArt.Text) + ''' AND ''' + (EFHastaCondProvArt.Text) + ''')) ');
     end;

     if (CBProvFam.Checked) then
     begin
        if (CBProvArt.Checked) then
           QMxCabecera.SelectSQL.Add('OR ')
        else
           QMxCabecera.SelectSQL.Add('AND ');

        QMxCabecera.SelectSQL.Add('(PROVEEDOR BETWEEN ' + (EFDesdeCondProv.Text) +
           ' AND ' + (EFHastaCondProv.Text) + ' ');
        QMxCabecera.SelectSQL.Add('AND TIPO=''' + 'PRF''' + ' ');
        QMxCabecera.SelectSQL.Add('AND FAMILIA BETWEEN ''' +
           (EFDesdeCondProvFam.Text) + ''' AND ''' + (EFHastaCondProvFam.Text) + ''') ');
     end;

     if (CBProvAgrArt.Checked) then
     begin
        if (CBProvArt.Checked or CBProvFam.Checked) then
           QMxCabecera.SelectSQL.Add('OR ')
        else
           QMxCabecera.SelectSQL.Add('AND ');

        QMxCabecera.SelectSQL.Add('(PROVEEDOR BETWEEN ' + (EFDesdeCondProv.Text) +
           ' AND ' + (EFHastaCondProv.Text) + ' ');
        QMxCabecera.SelectSQL.Add('AND TIPO=''' + 'PRG''' + ' ');
        QMxCabecera.SelectSQL.Add('AND AGRUPACION BETWEEN ''' +
           (EFDesdeCondProvAgrArt.Text) + ''' AND ''' + (EFHastaCondProvAgrArt.Text) + ''') ');
     end;

     QMxCabecera.SelectSQL.Add('AND ''' + FormatDateTime('mm/dd/yyyy', Date) + ''' BETWEEN  ALTA AND BAJA ');
     QMxCabecera.SelectSQL.Add('AND ACTIVO<>0 ');
     QMxCabecera.SelectSQL.Add('ORDER BY PROVEEDOR,TIPO,ARTICULO,FAMILIA,AGRUPACION ');

     {   for i:= 0 to QMxCabecera.SelectSQL.Count-1 do
       showmessage(QMxCabecera.SelectSQL[i]);      }

     DMMain.FiltraRO(DMLstCondicionesCompra.QMxCabecera, '11100', True);
  end;
end;

procedure TFPregCondicionesCompra.borrar_parametros;
var
  i : integer;
begin
  for i := 0 to DMLstCondicionesCompra.QMxCabecera.Params.Count - 1 do
     DMLstCondicionesCompra.QMxCabecera.Params[i].Clear;
end;

procedure TFPregCondicionesCompra.habilitar_btonsImpr();
var
  habilitar : boolean;
begin
  habilitar := (CBProvArt.Checked or CBProvFam.Checked or CBProvAgrArt.Checked);

  TButtImprimir.Enabled := habilitar;
  TButtPrevisualizar.Enabled := habilitar;
end;

//***********************************************************************

procedure TFPregCondicionesCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFPregCondicionesCompra.APrevExecute(Sender: TObject);
begin
  inherited;
  Info_Cond;
  DMLstCondicionesCompra.filtrarTabla(0);
end;

procedure TFPregCondicionesCompra.CBProvAgrArtClick(Sender: TObject);
begin
  inherited;
  if (CBProvAgrArt.Checked) then
  begin
     LDesdeCondProvAgrArt.Enabled := True;
     LHastaCondProvAgrArt.Enabled := True;
     EFDesdeCondProvAgrArt.Enabled := True;
     EFHastaCondProvAgrArt.Enabled := True;
  end
  else
  begin
     LDesdeCondProvAgrArt.Enabled := False;
     LHastaCondProvAgrArt.Enabled := False;
     EFDesdeCondProvAgrArt.Enabled := False;
     EFHastaCondProvAgrArt.Enabled := False;
  end;

  DMLstCondicionesCompra.Rango(4);
  EFDesdeCondProvAgrArt.Text := DMLstCondicionesCompra.minimo;
  EFHastaCondProvAgrArt.Text := DMLstCondicionesCompra.maximo;
  habilitar_btonsImpr();
end;

procedure TFPregCondicionesCompra.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(161, formato, cabecera, copias,
     pijama, '', DMLstCondicionesCompra.frCondicionesCompras,
     DMLstCondicionesCompra.HYReport);
end;

procedure TFPregCondicionesCompra.EFDesdeCondProvArtBusqueda(Sender: TObject);
begin
  inherited;
  TLFEditFind2000(Sender).CondicionBusqueda := 'Familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregCondicionesCompra.EFHastaCondProvArtBusqueda(Sender: TObject);
begin
  inherited;
  TLFEditFind2000(Sender).CondicionBusqueda := 'Familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregCondicionesCompra.EFDesdeCondProvFamBusqueda(Sender: TObject);
begin
  inherited;
  TLFEditFind2000(Sender).CondicionBusqueda := 'Familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregCondicionesCompra.EFHastaCondProvFamBusqueda(Sender: TObject);
begin
  inherited;
  TLFEditFind2000(Sender).CondicionBusqueda := 'Familia<>''' + REntorno.FamSistema + '''';
end;

end.
