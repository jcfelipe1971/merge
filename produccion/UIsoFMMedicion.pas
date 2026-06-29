unit UIsoFMMedicion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UDBDateTimePicker,
  StdCtrls, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo, ULFDBEditFind2000,
  ULFDBEdit, rxToolEdit, RXDBCtrl, UG2kTBLoc, ULFLabel, ULFDBDateEdit, ShellAPI;

type
  TIsoFMMedicion = class(TFPEdit)
     LRIG: TLFLabel;
     DBERIG: TLFDbedit;
     LDenominacion: TLFLabel;
     DBEDenominacion: TLFDbedit;
     LCodId: TLFLabel;
     DBECodId: TLFDbedit;
     LFechaAdq: TLFLabel;
     LFabricante: TLFLabel;
     DBEEFabricante: TLFDbedit;
     LNroSerie: TLFLabel;
     DBENSerie: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescrip: TLFDbedit;
     LUbicacion: TLFLabel;
     DBEUbicacion: TLFDbedit;
     LPCal: TLFLabel;
     DBEPCal: TLFDbedit;
     LUsuario: TLFLabel;
     DBEFUsuarios: TLFDBEditFind2000;
     DBEDescUsuario: TLFDbedit;
     LRangoMedida: TLFLabel;
     DBERangoMedida: TLFDbedit;
     LDivEscala: TLFLabel;
     DBEDivEscala: TLFDbedit;
     LIncertidumbre: TLFLabel;
     DBEIncertidumbre: TLFDbedit;
     LObservaciones: TLFLabel;
     DBMNotas: TLFDBMemo;
     LFrecuenciaCalibrado: TLFLabel;
     DBEFrecCal: TLFDbedit;
     PDetalle: TLFPanel;
     ToolBar1: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBENCertificado: TLFDbedit;
     LCertificado: TLFLabel;
     LFCategoryAction1: TLFCategoryAction;
     AFichaControl: TAction;
     DBDTPFechaAdq: TLFDBDateEdit;
     ALstConfig: TAction;
     LDias: TLFLabel;
     LFCategoryAction2: TLFCategoryAction;
     ALstSegRev: TAction;
     LFCategoryAction3: TLFCategoryAction;
     AAdjuntoMedicion: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FichadeControl1Click(Sender: TObject);
     procedure AFichaControlExecute(Sender: TObject);
     procedure ALstConfigExecute(Sender: TObject);
     procedure ALstSegRevExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure AAdjuntoMedicionExecute(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  IsoFMMedicion : TIsoFMMedicion;

implementation

uses UIsoDMMedicion, UFormGest, UDMMain, UDMListados, UFMListconfig,
  UIsoFMLstMedicion, URecibeFicheros, UFMAdjunto, UDMAdjunto, UUtiles,
  UFMain;

{$R *.DFM}

procedure TIsoFMMedicion.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);

  AbreData(TIsoDMMedicion, IsoDMMedicion);
  AbreData(TDMListados, DMListados);

  NavMain.DataSource := IsoDMMedicion.DSQMMedicionC;
  EPMain.DataSource := IsoDMMedicion.DSQMMedicionC;
  DBGMain.DataSource := IsoDMMedicion.DSQMMedicionC;
  NavDetalle.DataSource := IsoDMMedicion.DSQMMedicionD;
  DBGFDetalle.DataSource := IsoDMMedicion.DSQMMedicionD;
  G2KTableLoc.DataSource := IsoDMMedicion.DSQMMedicionC;
  CEMainPMEdit.Teclas := DMMain.teclas;
end;

procedure TIsoFMMedicion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(IsoDMMedicion);
end;

procedure TIsoFMMedicion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMMedicion.BusquedaCompleja;
end;

procedure TIsoFMMedicion.FichadeControl1Click(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';
  DMListados.Imprimir(8021, 0, '', str, IsoDMMedicion.frIsoInc, nil);
end;

procedure TIsoFMMedicion.AFichaControlExecute(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';
  DMListados.Imprimir(8021, 0, '', str, IsoDMMedicion.frIsoInc, nil);
end;

procedure TIsoFMMedicion.ALstConfigExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8021, Formato, Cabecera, Copias, Pijama, '', IsoDMMedicion.frIsoInc);
end;

procedure TIsoFMMedicion.ALstSegRevExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TIsoFMLstMedicion, IsoFMLstMedicion, Sender);
end;

procedure TIsoFMMedicion.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TIsoFMMedicion.WMDropFiles(var Msg: TWMDropFiles);
var
  i : integer;
  DropPoint : TPoint;
  RecibeFicheros : TRecibeFicheros;
  Ficheros : TStrings;
begin
  inherited;
  Ficheros := TStringList.Create;
  RecibeFicheros := TRecibeFicheros.Create(Msg.Drop);
  try
     for i := 0 to Pred(RecibeFicheros.FileCount) do
        Ficheros.Add(RecibeFicheros.Files[i]);

     DropPoint := RecibeFicheros.DropPoint;

     if ConfirmaMensaje(_('Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        AbreData(TDMAdjunto, DMAdjunto);
        try
           for i := 0 to Ficheros.Count - 1 do
              DMAdjunto.CreaAdjunto('MED', IsoDMMedicion.QMMedicionCID_ISO_MEDICION_C.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntoMedicion.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TIsoFMMedicion.AAdjuntoMedicionExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('MED', IsoDMMedicion.QMMedicionCID_ISO_MEDICION_C.AsInteger);
end;

procedure TIsoFMMedicion.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  AFichaControl.Execute;
end;

end.
