unit UFMHerenciaManual;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel, Mask, DBCtrls,
  ULFDBEdit;

type
  TFMHerenciaManual = class(TFPEditSinNavegador)
     PNLOrigen: TLFPanel;
     PNLSeleccionDestino: TLFPanel;
     DBEEjercicio: TLFDbedit;
     DBESerie: TLFDbedit;
     DBETipo: TLFDbedit;
     DBERIG: TLFDbedit;
     DBELinea: TLFDbedit;
     DBEArticulo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LSepSerie: TLFLabel;
     LLineaOrigen: TLFLabel;
     LDocumento: TLFLabel;
     LArticulo: TLFLabel;
     LEjercicio: TLFLabel;
     EFEjercicio: TLFEditFind2000;
     LCanal: TLFLabel;
     EFCanal: TLFEditFind2000;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     LTipo: TLFLabel;
     EFTipo: TLFEditFind2000;
     LNroDocumento: TLFLabel;
     EFNroDocumento: TLFEditFind2000;
     LLinea: TLFLabel;
     EFLinea: TLFEditFind2000;
     PNLDestino: TLFPanel;
     LSepSerieDestino: TLFLabel;
     LLineaDestino: TLFLabel;
     LDocumentoDestino: TLFLabel;
     LArticuloDestino: TLFLabel;
     DBEEjercicioDestino: TLFDbedit;
     DBESerieDestino: TLFDbedit;
     DBETipoDestino: TLFDbedit;
     DBERIGDestino: TLFDbedit;
     DBELineaDestino: TLFDbedit;
     DBEArticuloDestino: TLFDbedit;
     DBETituloDestino: TLFDbedit;
     TBSep1: TToolButton;
     TBAsociar: TToolButton;
     LAdvertencia: TLFLabel;
     BReempazar: TButton;
     LHintReemplazar: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFCanalBusqueda(Sender: TObject);
     procedure EFSerieBusqueda(Sender: TObject);
     procedure EFNroDocumentoBusqueda(Sender: TObject);
     procedure EFLineaBusqueda(Sender: TObject);
     procedure DatosDestinoChange(Sender: TObject);
     procedure TBAsociarClick(Sender: TObject);
     procedure BReempazarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Inicializa(Tipo: string; IDDetalleDoc: integer);
  end;

var
  FMHerenciaManual : TFMHerenciaManual;

implementation

uses
  UDMHerenciaManual, UDMMaestrosTallas, UDMMain, UFormGest, UParam;

{$R *.dfm}

procedure TFMHerenciaManual.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMHerenciaManual, DMHerenciaManual);
  LAdvertencia.Caption := '';
  BReempazar.Visible := False;
  LHintReemplazar.Visible := BReempazar.Visible;
end;

procedure TFMHerenciaManual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMHerenciaManual);
end;

procedure TFMHerenciaManual.Inicializa(Tipo: string; IDDetalleDoc: integer);
begin
  DMHerenciaManual.Inicializa(Tipo, IDDetalleDoc);
  EFEjercicio.Text := DMHerenciaManual.QMDetalleEJERCICIO.AsString;
  EFCanal.Text := DMHerenciaManual.QMDetalleCANAL.AsString;
  EFSerie.Text := DMHerenciaManual.QMDetalleSERIE.AsString;
  EFTipo.SetFocus;
end;

procedure TFMHerenciaManual.EFCanalBusqueda(Sender: TObject);
begin
  inherited;
  EFCanal.CondicionBusqueda := 'EJERCICIO=' + IntToStr(StrToIntDef(EFEjercicio.Text, 0));
end;

procedure TFMHerenciaManual.EFSerieBusqueda(Sender: TObject);
begin
  inherited;
  EFSerie.CondicionBusqueda := 'EJERCICIO=' + IntToStr(StrToIntDef(EFEjercicio.Text, 0)) + ' AND CANAL=' + IntToStr(StrToIntDef(EFCanal.Text, 0));
end;

procedure TFMHerenciaManual.EFNroDocumentoBusqueda(Sender: TObject);
begin
  inherited;
  if ((EFTipo.Text = 'OFC') or (EFTipo.Text = 'PEC') or (EFTipo.Text = 'ALB') or (EFTipo.Text = 'FAC')) then
     EFNroDocumento.Tabla_a_buscar := 'GES_CABECERAS_S'
  else
     EFNroDocumento.Tabla_a_buscar := 'GES_CABECERAS_E';

  EFNroDocumento.CondicionBusqueda := 'EJERCICIO=' + IntToStr(StrToIntDef(EFEjercicio.Text, 0)) + ' AND CANAL=' + IntToStr(StrToIntDef(EFCanal.Text, 0)) + ' AND SERIE=''' + EFSerie.Text + ''' AND TIPO=''' + EFTipo.Text + '''';
end;

procedure TFMHerenciaManual.EFLineaBusqueda(Sender: TObject);
begin
  inherited;
  if ((EFTipo.Text = 'OFC') or (EFTipo.Text = 'PEC') or (EFTipo.Text = 'ALB') or (EFTipo.Text = 'FAC')) then
     EFLinea.Tabla_a_buscar := 'GES_DETALLES_S'
  else
     EFLinea.Tabla_a_buscar := 'GES_DETALLES_E';

  EFLinea.CondicionBusqueda := 'EJERCICIO=' + IntToStr(StrToIntDef(EFEjercicio.Text, 0)) + ' AND CANAL=' + IntToStr(StrToIntDef(EFCanal.Text, 0)) + ' AND SERIE=''' + EFSerie.Text + ''' AND TIPO=''' + EFTipo.Text + ''' AND RIG=' + IntToStr(StrToIntDef(EFNroDocumento.Text, 0));
end;

procedure TFMHerenciaManual.DatosDestinoChange(Sender: TObject);
var
  Tipos : TStrings;
begin
  inherited;
  DMHerenciaManual.FiltraDestino(StrToIntDef(EFEjercicio.Text, 0), StrToIntDef(EFCanal.Text, 0), EFSerie.Text, EFTipo.Text, StrToIntDef(EFNroDocumento.Text, 0), StrToIntDef(EFLinea.Text, 0));

  if (EFTipo.Text > '') then
  begin
     Tipos := TStringList.Create;
     try
        // Tipos de documento posibles ordenados segun logica de traspasos. (TipoOrigen -> TipoDestino)
        Tipos.Add('OFC');
        Tipos.Add('PEC');
        Tipos.Add('ALB');
        Tipos.Add('FAC');
        Tipos.Add('OFP');
        Tipos.Add('OCP');
        Tipos.Add('PEP');
        Tipos.Add('ALP');
        Tipos.Add('FAP');

        LAdvertencia.Caption := '';
        if ((Tipos.IndexOf(DBETipo.Text)) > (Tipos.IndexOf(EFTipo.Text))) then
           LAdvertencia.Caption := _('Esta seguro de que el *destino* de esta linea es un tipo de documento previo?');
     finally
        Tipos.Free;
     end;
  end;

  BReempazar.Visible := False;
  if ((DBETipo.Text = 'ALB') and (EFTipo.Text = 'FAC') and (LeeParametro('TRAALBC001', EFSerie.Text) = 'S')) then
     BReempazar.Visible := True;
  if ((DBETipo.Text = 'ALP') and (EFTipo.Text = 'FAP') and (LeeParametro('TRAALPC001', EFSerie.Text) = 'S')) then
     BReempazar.Visible := True;

  LHintReemplazar.Visible := BReempazar.Visible;
end;

procedure TFMHerenciaManual.TBAsociarClick(Sender: TObject);
begin
  inherited;
  DMHerenciaManual.Asociar;
  Close;
end;

procedure TFMHerenciaManual.BReempazarClick(Sender: TObject);
begin
  inherited;
  DMHerenciaManual.Reemplazar;
  Close;
end;

end.
