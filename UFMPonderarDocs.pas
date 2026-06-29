unit UFMPonderarDocs;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ToolWin, ComCtrls, UEditPanel, ActnList, StdCtrls, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  rxToolEdit, ULFActionList, ULFEdit, ULFCheckBox, ULFDBEdit, ULFPanel,
  ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, rxPlacemnt,
  ULFFormStorage, ULFDateEdit;

type
  TFMPonderarDocs = class(TG2KForm)
     TBMain: TLFToolBar;
     ALMain: TLFActionList;
     ASalir: TAction;
     APonderarDocs: TAction;
     EPPonderarDocs: THYMEditPanel;
     TBPonderarDocs: TToolButton;
     PnPonderarDocs: TLFPanel;
     RGTipoDoc: TRadioGroup;
     GBArticulos: TGroupBox;
     Label2: TLFLabel;
     EFArtDesde: TLFEditFind2000;
     DBEArtDesde: TLFDbedit;
     DBEArtHasta: TLFDbedit;
     EFArtHasta: TLFEditFind2000;
     Label3: TLFLabel;
     GBAlmacen: TGroupBox;
     EFAlmacen: TLFEditFind2000;
     DBAlmacen: TLFDbedit;
     CBTodosArt: TLFCheckBox;
     GBFechas: TGroupBox;
     Label4: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     Label5: TLFLabel;
     GBSerie: TGroupBox;
     EFSerie: TLFEditFind2000;
     DBESerieD: TLFDbedit;
     GBNDoc: TGroupBox;
     Label1: TLFLabel;
     Label6: TLFLabel;
     EdDocDesde: TLFEdit;
     EdDocHasta: TLFEdit;
     ARecargar: TAction;
     TBRecargar: TToolButton;
     ToolButton2: TToolButton;
     CBTodasSeries: TLFCheckBox;
     CBTodosAlm: TLFCheckBox;
     CBTodosDoc: TLFCheckBox;
     FSMain: TLFFibFormStorage;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBTodosArtClick(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure EFArtDesdeExit(Sender: TObject);
     procedure EFArtHastaExit(Sender: TObject);
     procedure EFArtDesdeBusqueda(Sender: TObject);
     procedure APonderarDocsExecute(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure CBTodosAlmClick(Sender: TObject);
     procedure CBTodasSeriesClick(Sender: TObject);
  private
     { Private declarations }
     procedure ObtenerTipo(var Tipo: string);
     function ObtenerModo: smallint;
  public
     { Public declarations }
  end;

var
  FMPonderarDocs : TFMPonderarDocs;

implementation

{$R *.DFM}

uses UDMMain, UDMPonderarDocs, UEntorno;

procedure TFMPonderarDocs.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMPonderarDocs, DMPonderarDocs);
  ARecargarExecute(Self);
end;

procedure TFMPonderarDocs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPonderarDocs);
  Action := caFree;
end;

procedure TFMPonderarDocs.CBTodosArtClick(Sender: TObject);
begin
  if CBTodosArt.State = cbUnchecked then
  begin
     EFArtDesde.Enabled := True;
     EFArtDesde.Color := clWindow;
     EFArtDesde.Font.Color := clWindowText;
     EFArtHasta.Enabled := True;
     EFArtHasta.Color := clWindow;
     EFArtHasta.Font.Color := clWindowText;
  end
  else
  begin
     EFArtDesde.Enabled := False;
     EFArtDesde.Color := clInfoBk;
     EFArtDesde.Font.Color := clGrayText;
     EFArtHasta.Enabled := False;
     EFArtHasta.Color := clInfoBk;
     EFArtHasta.Font.Color := clGrayText;
  end;
end;

procedure TFMPonderarDocs.EFAlmacenChange(Sender: TObject);
begin
  DMPonderarDocs.RefrescarAlmacen(EFAlmacen.Text);
end;

procedure TFMPonderarDocs.EFSerieChange(Sender: TObject);
begin
  DMPonderarDocs.RefrescarSerie(EFSerie.Text);
end;

procedure TFMPonderarDocs.EFArtDesdeExit(Sender: TObject);
begin
  DMPonderarDocs.RefrescarArtDesde(EFArtDesde.Text);
end;

procedure TFMPonderarDocs.EFArtHastaExit(Sender: TObject);
begin
  DMPonderarDocs.RefrescarArtHasta(EFArtHasta.Text);
end;

procedure TFMPonderarDocs.EFArtDesdeBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMPonderarDocs.APonderarDocsExecute(Sender: TObject);
var
  Modo : smallint;
  Tipo : string;
  DocD, DocH : integer;
begin
  // Modo := 0; No se utiliza
  DocD := StrToIntDef(EdDocDesde.Text, 0);
  DocH := StrToIntDef(EdDocHasta.Text, 0);
  ObtenerTipo(Tipo);
  Modo := ObtenerModo;
  DMPonderarDocs.Ponderar(EFSerie.Text, Tipo, EFAlmacen.Text,
     EFArtDesde.Text, EFArtHasta.Text,
     DTPDesde.Date, DTPHasta.Date, DocD, DocH, Modo);
end;

procedure TFMPonderarDocs.ObtenerTipo(var Tipo: string);
begin
  Tipo := 'FAC';
  case RGTipoDoc.ItemIndex of
     0: Tipo := 'OFC';
     1: Tipo := 'PEC';
     2: Tipo := 'ALB';
  end;
end;

procedure TFMPonderarDocs.ARecargarExecute(Sender: TObject);
var
  Tipo : string;
begin
  ObtenerTipo(Tipo);
  DMPonderarDocs.Recargar(Tipo);
  CBTodosArt.State := cbChecked;
  CBTodosArtClick(Self);
  EdDocDesde.Text := DMPonderarDocs.MinNDoc;
  EdDocHasta.Text := DMPonderarDocs.MaxNDoc;
  DTPDesde.Date := Trunc(DMPonderarDocs.MinFecha);
  DTPHasta.Date := Trunc(DMPonderarDocs.MaxFecha);
  EFAlmacen.Text := DMPonderarDocs.MinAlmacen;
  EFSerie.Text := DMPonderarDocs.MinSerie;
end;

procedure TFMPonderarDocs.CBTodosAlmClick(Sender: TObject);
begin
  if ((Sender as TLFCheckBox).Checked = True) then
  begin
     EFAlmacen.Enabled := False;
     EFAlmacen.ReadOnly := True;
     EFAlmacen.Color := clInfoBk;
     EFAlmacen.Font.Color := clGrayText;
  end
  else
  begin
     EFAlmacen.Enabled := True;
     EFAlmacen.ReadOnly := False;
     EFAlmacen.Color := clWindow;
     EFAlmacen.Font.Color := clWindowText;
  end;
end;

procedure TFMPonderarDocs.CBTodasSeriesClick(Sender: TObject);
begin
  if ((Sender as TLFCheckBox).Checked = True) then
  begin
     EFSerie.Enabled := False;
     EFSerie.ReadOnly := True;
     EFSerie.Color := clInfoBk;
     EFSerie.Font.Color := clGrayText;
  end
  else
  begin
     EFSerie.Enabled := True;
     EFSerie.ReadOnly := False;
     EFSerie.Color := clWindow;
     EFSerie.Font.Color := clWindowText;
  end;
end;

function TFMPonderarDocs.ObtenerModo: smallint;
begin
  Result := 0;
  if (CBTodosArt.Checked) then
     Result := Result or 1;
  if (CBTodosAlm.Checked) then
     Result := Result or 2;
  if (CBTodasSeries.Checked) then
     Result := Result or 4;
end;

end.
