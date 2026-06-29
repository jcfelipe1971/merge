unit UFMRHPersona;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, DBCtrls, ULFDBEdit, StdCtrls, ULFLabel,
  Mask, rxToolEdit, RXDBCtrl, ULFDBDateEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, RxDBComb;

type
  TFMRHPersona = class(TFPEdit)
     DBDEFecha: TLFDBDateEdit;
     LId: TLFLabel;
     DBID: TLFDbedit;
     LEntrevistador: TLFLabel;
     DBEEntrevistador: TLFDbedit;
     LPuestoTrabajo: TLFLabel;
     DBEPuestoTrab: TLFDbedit;
     DBCHKAceptado: TLFDBCheckBox;
     DBDEAceptado: TLFDBDateEdit;
     LAceptado: TLFLabel;
     LFDBKBaja: TLFDBCheckBox;
     LNombre: TLFLabel;
     DBENombre: TLFDbedit;
     DBEApellidos: TLFDbedit;
     LApellidos: TLFLabel;
     DBESegSoc: TLFDbedit;
     LSegSoc: TLFLabel;
     DBDFNacimiento: TLFDBDateEdit;
     LFNacimiento: TLFLabel;
     DBCHKMinusvalia: TLFDBCheckBox;
     DBCBGenero: TRxDBComboBox;
     LGenero: TLFLabel;
     LblEstadoCivil: TLFLabel;
     DBEEstadoCivil: TLFDbedit;
     LTelefonos: TLFLabel;
     DBETelefono1: TLFDbedit;
     DBETelefono2: TLFDbedit;
     DBECorreo: TLFDbedit;
     LCorreo: TLFLabel;
     DBEValoracion1: TLFDbedit;
     LValoracion1: TLFLabel;
     LValoracion2: TLFLabel;
     DBEValoracion2: TLFDbedit;
     LValoracion3: TLFLabel;
     DBEValoracion3: TLFDbedit;
     DBMNotas: TDBRichEdit;
     DBMFormacion: TDBRichEdit;
     DBMExpProf: TDBRichEdit;
     LFCategoryAction1: TLFCategoryAction;
     AAdjuntoPersona: TAction;
     LFEntrevista: TLFLabel;
     PNLDatosPersona: TLFPanel;
     PNLNotas: TLFPanel;
     LNotas: TLFLabel;
     LExperienciaProfesional: TLFLabel;
     LFormacion: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure Filtrar(Filtro: string);
     procedure AAdjuntoPersonaExecute(Sender: TObject);
     procedure PNLNotasResize(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMRHPersona : TFMRHPersona;

implementation

uses UDMRHPersona, UFormGest, UFMAdjunto, UDMMain,
  ShellApi, URecibeFicheros, UUtiles, UDMAdjunto, UFMain;

{$R *.dfm}

procedure TFMRHPersona.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  AbreData(TDMRHPersona, DMRHPersona);
  DBGMain.DataSource := DMRHPersona.DSQMRHPersona;
  NavMain.DataSource := DMRHPersona.DSQMRHPersona;
  G2kTableLoc.DataSource := DMRHPersona.DSQMRHPersona;

  PNLNotasResize(Sender);
end;

procedure TFMRHPersona.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRHPersona);
end;

procedure TFMRHPersona.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMRHPersona.Filtrar(Filtro: string);
begin
  // Se espera el codigo de concepto
  DMRHPersona.Filtrar(Filtro);
end;

procedure TFMRHPersona.AAdjuntoPersonaExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('PER', DMRHPersona.QMRHPersonaID_PERSONA.AsInteger);
end;

procedure TFMRHPersona.PNLNotasResize(Sender: TObject);
var
  h : integer;
begin
  inherited;
  h := PNLNotas.Height div 3;

  DBMNotas.Top := 0;
  DBMNotas.Height := h;
  LNotas.Top := 0;

  DBMFormacion.Top := h;
  DBMFormacion.Height := h;
  LFormacion.Top := h;

  DBMExpProf.Top := 2 * h;
  DBMExpProf.Height := h;
  LExperienciaProfesional.Top := 2 * h;
end;

procedure TFMRHPersona.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMRHPersona.BusquedaCompleja;
end;

procedure TFMRHPersona.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('PER', DMRHPersona.QMRHPersonaID_PERSONA.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntoPersona.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

end.
