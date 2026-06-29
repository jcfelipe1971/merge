unit UFMPackingList;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, UNavigator, Grids,
  DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, Menus,
  UTeclas, UControlEdit, StdCtrls, Mask, DBCtrls, ULFDBEdit, UEntorno,
  UFPEditSinNavegador, UEditPanel, ULFLabel, ULFEdit, ULFFIBDBEditFind,
  ULFDBEditFind2000, ULFEditFind2000, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  ULFDBMemo, ULFPageControl;

type
  TFMPackingList = class(TFPEditSinNavegador)
     PNLBultos: TLFPanel;
     TVBultos: TTreeView;
     ALPackingList: TLFActionList;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGDetalle: TDBGridFind2000;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     ATraspasarUds: TAction;
     TSep1: TToolButton;
     TButtTraspasarUds: TToolButton;
     ATraspasarTodasUds: TAction;
     TButtTraspasarTodasUds: TToolButton;
     ATraspasarBulto: TAction;
     ABorrarBulto: TAction;
     ASubirOrdenBulto: TAction;
     ABajarOrdenBulto: TAction;
     PBulto: TLFPanel;
     DBEBultoActual: TLFDbedit;
     TSep2: TToolButton;
     ACambiarNumBultoIni: TAction;
     AAgrupar: TAction;
     AInformePackingList: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfListadoPackingList: TAction;
     LFCategoryAction2: TLFCategoryAction;
     LFCategoryAction3: TLFCategoryAction;
     ADistribuir: TAction;
     AEtiquetaPackingList: TAction;
     AConfEtiquetaPackingList: TAction;
     PNLBulto: TLFPanel;
     TBBulto: TLFToolBar;
     NavBulto: THYMNavigator;
     LNumero: TLFLabel;
     DBENumeroBulto: TLFDbedit;
     DBETituloBulto: TLFDbedit;
     LTituloBulto: TLFLabel;
     LPesoNeto: TLFLabel;
     DBEPesoNeto: TLFDbedit;
     DBEPesoBruto: TLFDbedit;
     LPesoBruto: TLFLabel;
     DBEVolumen: TLFDbedit;
     LVolumen: TLFLabel;
     DBEDiametroUnitario: TLFDbedit;
     LDiametroUnitario: TLFLabel;
     DBEPESO: TLFDbedit;
     LPeso: TLFLabel;
     PNLArbol: TLFPanel;
     TBArbol: TLFToolBar;
     TBBorrarBulto: TToolButton;
     TBSep1: TToolButton;
     TBSubirOrdenBulto: TToolButton;
     TBBajarOrdenBulto: TToolButton;
     TBSep2: TToolButton;
     TBSep3: TToolButton;
     TBTraspasarBulto: TToolButton;
     TBSep4: TToolButton;
     TBCambiarNumBultoIni: TToolButton;
     TBAgrupar: TToolButton;
     TBSep5: TToolButton;
     TBDistribuir: TToolButton;
     AInsertarBulto: TAction;
     TBInsertarBulto: TToolButton;
     LSSCC: TLFLabel;
     DBESSCC: TLFDbedit;
     LTipoBulto: TLFLabel;
     DBEFTipoBulto: TLFDBEditFind2000;
     ETipoBulto: TLFEdit;
     LUnidades: TLFLabel;
     DBETotalUnidades: TLFDbedit;
     AGenerarSSCC: TAction;
     TBSep6: TToolButton;
     TBGenerarSSCC: TToolButton;
     TBSep7: TToolButton;
     TButtDividirEnCajas: TToolButton;
     ADividirEnBultos: TAction;
     PNLTipoBultoDefecto: TLFPanel;
     LTipoBultoDefecto: TLFLabel;
     EFTipoBultoDefecto: TLFEditFind2000;
     ETipoBultoDefecto: TLFEdit;
     spl1: TSplitter;
     EContadorBulto: TLFEdit;
     LContadorBulto: TLFLabel;
     TBSep8: TToolButton;
     ABorrarBultosVacios: TAction;
     TBBorrarCajasVacias: TToolButton;
     TBEnviarMail: TToolButton;
     AEnviarCorreo: TAction;
     PNLBuscarArticulo: TLFPanel;
     EFArticulo: TLFEditFind2000;
     LArticulo: TLFLabel;
     LAltura: TLFLabel;
     DBEAltura: TLFDbedit;
     TBCrearCajas: TToolButton;
     TBSep9: TToolButton;
     ACrearBultos: TAction;
     LAlto: TLFLabel;
     DBEAlto: TLFDbedit;
     LAncho: TLFLabel;
     DBEAncho: TLFDbedit;
     LFondo: TLFLabel;
     DBEFondo: TLFDbedit;
     BCalcularVolumen: TButton;
     AAgregarArticulosSinControlStock: TAction;
     TBSep10: TToolButton;
     TBBorrarLinea: TToolButton;
     ABorrarLinea: TAction;
     PCMain: TLFPageControl;
     TSBulto: TTabSheet;
     TSEmbarque: TTabSheet;
     TBEmbarque: TLFToolBar;
     NavEmbarque: THYMNavigator;
     DBMIzquierda: TLFDBMemo;
     DBMDerecha: TLFDBMemo;
     PNLDatosEmbarque: TLFPanel;
     PNLEmbarque: TLFPanel;
     LFechaPackingList: TLFLabel;
     DBDEFechaEmbarque: TLFDBDateEdit;
     TBEtiqueta: TToolButton;
     PNLDatosEmbarqueIzq: TLFPanel;
     PNLDatosEmbarqueDer: TLFPanel;
     LDatosEmbarqueIzq: TLFLabel;
     LDatosEmbarqueDer: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TVBultosDeletion(Sender: TObject; Node: TTreeNode);
     procedure ATraspasarUdsExecute(Sender: TObject);
     procedure ATraspasarTodasUdsExecute(Sender: TObject);
     procedure ATraspasarBultoExecute(Sender: TObject);
     procedure ABorrarBultoExecute(Sender: TObject);
     procedure ASubirOrdenBultoExecute(Sender: TObject);
     procedure ABajarOrdenBultoExecute(Sender: TObject);
     procedure ACambiarNumBultoIniExecute(Sender: TObject);
     procedure AAgruparExecute(Sender: TObject);
     procedure AInformePackingListExecute(Sender: TObject);
     procedure AConfListadoPackingListExecute(Sender: TObject);
     procedure TVBultosChange(Sender: TObject; Node: TTreeNode);
     procedure ADistribuirExecute(Sender: TObject);
     procedure LFCategoryAction1Execute(Sender: TObject);
     procedure AEtiquetaPackingListExecute(Sender: TObject);
     procedure AConfEtiquetaPackingListExecute(Sender: TObject);
     procedure NavBultoClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure AInsertarBultoExecute(Sender: TObject);
     procedure DBEFTipoBultoChange(Sender: TObject);
     procedure TVBultosDragDrop(Sender, Source: TObject; X, Y: integer);
     procedure TVBultosDragOver(Sender, Source: TObject; X, Y: integer; State: TDragState; var Accept: boolean);
     procedure DBGDetalleColEnter(Sender: TObject);
     procedure AGenerarSSCCExecute(Sender: TObject);
     procedure ADividirEnBultosExecute(Sender: TObject);
     procedure EFTipoBultoDefectoChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure ABorrarBultosVaciosExecute(Sender: TObject);
     procedure AEnviarCorreoExecute(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure DBGDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TVBultosCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: boolean);
     procedure ACrearBultosExecute(Sender: TObject);
     procedure BCalcularVolumenClick(Sender: TObject);
     procedure DBENumeroBultoChange(Sender: TObject);
     procedure AAgregarArticulosSinControlStockExecute(Sender: TObject);
     procedure ABorrarLineaExecute(Sender: TObject);
     procedure PNLEmbarqueResize(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     Tipo: string;
     Serie: string;
     Cliente: integer;
     Ejercicio: integer;
     RIG: integer;
     ID_S: integer;
     procedure LlenarArbol(IdBulto: integer = 0);
     function DameIdBulto(Nodo: TTreeNode): integer;
     procedure Traspasa(Modo: smallint);
     {procedure ModificarCampos(Modo: smallint);}
     procedure Agrupa;
     procedure HabilitaBotones;
     procedure VerificaMedidas;
  public
     { Public declarations }
     procedure AbrirDatos(aTipo: string; aID_S: integer);
  end;

var
  FMPackingList : TFMPackingList;

implementation

{$R *.dfm}

uses
  UDMMain, UDMPackingList, UFMPackingListTraspasos, UFMPackingListEdCampos,
  UDMLstPackingList, UFMListConfig, UFMSeleccion, UFMain,
  UUtiles, UFSendCorreo, UDMListados, DateUtils, UParam, UDameDato;

procedure TFMPackingList.FormCreate(Sender: TObject);
begin
  inherited;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;

  AbreData(TDMPackingList, DMPackingList);

  NavDetalle.DataSource := DMPackingList.DSQMBultosDet;
  // NavDetalle.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbEdit];
  DBGDetalle.DataSource := DMPackingList.DSQMBultosDet;
  CEDetallePMEdit.Teclas := DMMain.Teclas;

  NavEmbarque.DataSource := DMPackingList.DSQMDatosEmbarque;
  DBMIzquierda.DataSource := DMPackingList.DSQMDatosEmbarque;
  DBMDerecha.DataSource := DMPackingList.DSQMDatosEmbarque;

  ControlEdit := CEDetalle;
  HabilitaBotones;
  DMPackingList.SetTipoBultoDefecto(StrToIntDef(EFTipoBultoDefecto.Text, 0));
  EContadorBulto.Text := '1';
end;

procedure TFMPackingList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPackingList);
end;

procedure TFMPackingList.TVBultosDeletion(Sender: TObject; Node: TTreeNode);
begin
  if (Node.Data <> nil) then
     Dispose(PPackingListInfo(Node.Data));
end;

procedure AdicionaHijo(Padre: TTreeNode; Info: PPackingListInfo; Articulo: string);
var
  Hijos : TList;
  i : integer;
  NodoLoc : TTreeNode;
  PrimeraVez : boolean;
  Descripcion : string;
begin
  PrimeraVez := Padre = nil;

  if (PrimeraVez) then
     Descripcion := Info^.NumeroBulto
  else
  begin
     Descripcion := '[' + Info^.NumeroBulto + ']';
     if (Info^.Titulo <> '') then
        Descripcion := Descripcion + ' ' + Info^.Titulo + '';
  end;

  Hijos := DMPackingList.ObtenerHijos(Info^.ID_B, Articulo);
  try
     if Hijos.Count > 0 then
     begin
        Padre := FMPackingList.TVBultos.Items.AddChildObject(Padre, Descripcion, Info);

        if (PrimeraVez) then
        begin
           Padre.ImageIndex := 90;
           Padre.SelectedIndex := 90;
        end
        else
        begin
           Padre.ImageIndex := 66;
           Padre.SelectedIndex := 25;
        end;

        for i := 0 to Hijos.Count - 1 do
           AdicionaHijo(Padre, Hijos[i], Articulo);
     end
     else
     begin
        NodoLoc := FMPackingList.TVBultos.Items.AddChildObject(Padre, Descripcion, Info);
        NodoLoc.ImageIndex := 66;
        NodoLoc.SelectedIndex := 25;
     end;
  finally
     Hijos.Free;
  end;
end;

procedure TFMPackingList.LlenarArbol(IdBulto: integer = 0);
var
  Info : PPackingListInfo;
  i : integer;
  IdDetalleDoc : integer;
begin
  IdDetalleDoc := DMPackingList.QMBultosDetID_DETALLES_S.AsInteger;

  TVBultos.Items.Clear;

  New(Info);
  Info^.NumeroBulto := _('Configuración de Bultos');
  Info^.ID_B := 0;
  Info^.ID_B_PADRE := 0;
  Info^.Nivel := 0;
  Info^.Orden := 0;
  Info^.Grupo := 0;
  Info^.Titulo := '';
  Info^.Unidades := 0;
  Info^.ContieneArticulo := False;
  AdicionaHijo(nil, Info, EFArticulo.Text);

  TVBultos.FullExpand;

  // Posiciono
  if (IdBulto >= 0) then
  begin
     with TVBultos do
     begin
        for i := 0 to Items.Count - 1 do
        begin
           if (Items[i] <> nil) then
              if (PPackingListInfo(Items[i].Data)^.ID_B = IdBulto) then
                 Items[i].Selected := True;
        end;
     end;
  end;

  Posicionar(DMPackingList.QMBultosDet, 'ID_DETALLES_S', IdDetalleDoc);
end;

procedure TFMPackingList.AbrirDatos(aTipo: string; aID_S: integer);
begin
  Tipo := aTipo;
  ID_S := aID_S;
  DMPackingList.Inicializar(Tipo, ID_S, Serie, RIG, Ejercicio, Cliente);
  LlenarArbol;
end;

function TFMPackingList.DameIdBulto(Nodo: TTreeNode): integer;
begin
  if (Nodo <> nil) then
     Result := PPackingListInfo(Nodo.Data)^.ID_B
  else
     Result := 0;
end;

procedure TFMPackingList.ATraspasarUdsExecute(Sender: TObject);
begin
  Traspasa(0);
  HabilitaBotones;
end;

procedure TFMPackingList.Traspasa(Modo: smallint);
var
  FMTraspasos : TFMPackingListTraspasos;
  IdBultoActual, ID_B_D : integer;
  IdDetallesS, IdBulto : integer;
  TipoBultoDefecto : string;
  UnidadesATraspasar : double;
  NumeroBultoDestino : string;
  TituloBulto : string;
begin
  IdBultoActual := DMPackingList.QMBultoActualID_B.AsInteger;
  FMTraspasos := TFMPackingListTraspasos.Create(Self);
  with FMTraspasos do
     try
        if (CapturaDatos(Modo)) then
           case Modo of
              0, 1:
              begin
                 if ((Unidades > 0) and (NumeroBulto <> '')) then
                 begin
                    ID_B_D := DMPackingList.ObtenerID_B(NumeroBulto);
                    if (ID_B_D = 0) then
                       DMPackingList.CrearNuevoBulto(NumeroBulto, Unidades, 1)
                    else
                       DMPackingList.TraspasaUds(ID_B_D, Unidades, NumeroBulto, 1);
                 end;
              end;
              2:
              begin
                 if (NumeroBulto <> '') then
                 begin
                    ID_B_D := DMPackingList.ObtenerID_B(NumeroBulto);
                    DMPackingList.TraspasaBulto(ID_B_D);
                 end;
              end;
              4:
              begin
                 if (Unidades > 0) then
                 begin
                    // Guardo configuracion de tipo bulto defecto
                    TipoBultoDefecto := EFTipoBultoDefecto.Text;

                    EFTipoBultoDefecto.Text := IntToStr(TipoBulto);
                    UnidadesATraspasar := 1;
                    IdDetallesS := DMPackingList.QMBultosDetID_DETALLES_S.AsInteger;
                    IdBulto := DMPackingList.QMBultosDetID_B.AsInteger;
                    while UnidadesATraspasar > 0 do
                    begin
                       // Unidades que quedan por traspasar
                      {
                      with THYFIBQuery.Create(Self) do
                      begin
                         try
                            Database := DMMain.Database;
                            SQL.Text := 'SELECT UNIDADES FROM GES_DETALLES_S_BULTOS WHERE ID_DETALLES_S = :ID_DETALLES_S AND ID_B = :ID_B';
                            Params.ByName['ID_DETALLES_S'].AsInteger := IdDetallesS;
                            Params.ByName['ID_B'].AsInteger := IdBulto;
                            ExecQuery;
                            UnidadesATraspasar := FieldByName['UNIDADES'].AsFloat;
                         finally
                            Free;
                         end;
                      end;
                      }
                       with DMPackingList.QMBultosDet do
                       begin
                          First;

                          while ((not EOF) and ((DMPackingList.QMBultosDetID_DETALLES_S.AsInteger <> IdDetallesS) or (DMPackingList.QMBultosDetID_B.AsInteger <> IdBulto))) do
                             Next;

                          if ((DMPackingList.QMBultosDetID_DETALLES_S.AsInteger = IdDetallesS) and (DMPackingList.QMBultosDetID_B.AsInteger = IdBulto)) then
                             UnidadesATraspasar := DMPackingList.QMBultosDetUNIDADES.AsFloat
                          else
                             UnidadesATraspasar := 0;
                       end;

                       // Creo nuevo bulto y obtengo su numero
                       TituloBulto := '';
                       if (StrToIntDef(EContadorBulto.Text, -1) >= 0) then
                       begin
                          TituloBulto := EContadorBulto.Text;
                          EContadorBulto.Text := IntToStr(StrToIntDef(EContadorBulto.Text, 0) + 1);
                       end;

                       ID_B_D := DMPackingList.InsertaBulto(0, TituloBulto);
                       NumeroBultoDestino := DMPackingList.DameNumeroBulto(ID_B_D);

                       // Traspaso unidades al nuevo butlo
                       if (UnidadesATraspasar > Unidades) then
                          DMPackingList.TraspasaUds(ID_B_D, Unidades, NumeroBultoDestino, 1)
                       else
                          DMPackingList.TraspasaUds(ID_B_D, UnidadesATraspasar, NumeroBultoDestino, 1);

                       UnidadesATraspasar := UnidadesATraspasar - Unidades;
                    end;

                    // Recargo configuracion de tipo bulto defecto
                    EFTipoBultoDefecto.Text := TipoBultoDefecto;
                 end;
              end;
           end;
     finally
        Free;
     end;

  LlenarArbol(IdBultoActual);
end;

procedure TFMPackingList.ATraspasarTodasUdsExecute(Sender: TObject);
begin
  Traspasa(1);
  HabilitaBotones;
end;

procedure TFMPackingList.ATraspasarBultoExecute(Sender: TObject);
begin
  // Mover el bulto dentro de otro.
  Traspasa(2);
  HabilitaBotones;
end;

procedure TFMPackingList.ABorrarBultoExecute(Sender: TObject);
begin
  DMPackingList.BorrarBulto;
  LlenarArbol;
  HabilitaBotones;
end;

{procedure TFMPackingList.ModificarCampos(Modo: smallint);
var
  FMEdCampos : TFMPackingListEdCampos;
begin
  FMEdCampos := TFMPackingListEdCampos.Create(Self);
  with FMEdCampos do
     try
        ModificarDatos(Modo);
     finally
        Free;
     end;
end;}

procedure TFMPackingList.ASubirOrdenBultoExecute(Sender: TObject);
begin
  DMPackingList.CambiarOrden(-1);
  LlenarArbol(DMPackingList.QMBultoActualID_B.AsInteger);
  HabilitaBotones;
end;

procedure TFMPackingList.ABajarOrdenBultoExecute(Sender: TObject);
begin
  DMPackingList.CambiarOrden(1);
  LlenarArbol(DMPackingList.QMBultoActualID_B.AsInteger);
  HabilitaBotones;
end;

procedure TFMPackingList.ACambiarNumBultoIniExecute(Sender: TObject);
var
(*
  FMNumBulto : TFMPackingListNumBulto;
*)
  Valor : integer;
begin
  Valor := 1;
  if PideDato('INT', Valor, _('Introduzca el número del bulto')) then
  begin
     DMPackingList.CambioBultoInicial(IntToStr(Valor));
     LlenarArbol(DMPackingList.QMBultoActualID_B.AsInteger);
  end;
  (*
  FMNumBulto := FMPackingListNumBulto.Create(Self);
  with FMNumBulto do
     try
        if ((ShowModal = mrOk) and (NumeroBulto <> '')) then
        begin
           DMPackingList.CambioBultoInicial(NumeroBulto);
           LlenarArbol(DMPackingList.QMBultoActualID_B.AsInteger);
        end;
     finally
        Free;
     end;
  *)
  HabilitaBotones;
end;

procedure TFMPackingList.Agrupa;
var
  FMTraspasos : TFMPackingListTraspasos;
  ID_B_D : integer;
begin
  ID_B_D := 0;
  FMTraspasos := TFMPackingListTraspasos.Create(Self);
  with FMTraspasos do
     try
        if (CapturaDatos(3)) then
           if (NumeroBulto <> '') then
           begin
              ID_B_D := DMPackingList.ObtenerID_B(NumeroBulto);
              DMPackingList.AgruparBulto(ID_B_D);
           end;
     finally
        Free;
     end;

  LlenarArbol(ID_B_D);
end;

procedure TFMPackingList.AAgruparExecute(Sender: TObject);
begin
  Agrupa;
  HabilitaBotones;
end;

procedure TFMPackingList.AInformePackingListExecute(Sender: TObject);
begin
  AbreData(TDMLstPackingList, DMLstPackingList);
  DMLstPackingList.MostrarListado(DMPackingList.QMBultosDetID_S.AsInteger, 0, DMPackingList.QMBultosDetSERIE.AsString);
  CierraData(DMLstPackingList);
end;

procedure TFMPackingList.HabilitaBotones;
begin
  {
  TButtTraspasarUds.Enabled := DMPackingList.HayDatosDet;
  TButtTraspasarTodasUds.Enabled := DMPackingList.HayDatosDet;
  TButtCambiaPesoUnit.Enabled := DMPackingList.HayDatosDet;

  TButtTraspasarBulto.Enabled := DMPackingList.BultoSelec;
  TButtBorrarBulto.Enabled := DMPackingList.BultoSelec and DMPackingList.BultoVacio;
  TButtCambiaDatosBulto.Enabled := DMPackingList.BultoSelec;
  TButtSubirOrdenBulto.Enabled := DMPackingList.BultoSelec;
  TButtBajarOrdenBulto.Enabled := DMPackingList.BultoSelec;
  TButtAgruparBulto.Enabled := DMPackingList.BultoSelec;
  }
end;

procedure TFMPackingList.AConfListadoPackingListExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPackingList, DMLstPackingList);

  TFMListConfig.Create(Self).Muestra(600, formato, cabecera, copias, pijama, Serie, DMLstPackingList.frPackingList);

  CierraData(DMLstPackingList);
end;

procedure TFMPackingList.TVBultosChange(Sender: TObject; Node: TTreeNode);
begin
  TVBultos.FullExpand;
  DMPackingList.AbrirDetBulto(DameIdBulto(TVBultos.Selected));
  HabilitaBotones;
end;

procedure TFMPackingList.ADistribuirExecute(Sender: TObject);
begin
  DMPackingList.DistribuirBulto;
  LlenarArbol;
end;

procedure TFMPackingList.LFCategoryAction1Execute(Sender: TObject);
begin
  AbreData(TDMLstPackingList, DMLstPackingList);
  DMLstPackingList.MostrarListado(DMPackingList.QMBultosDetID_S.AsInteger, 0, DMPackingList.QMBultosDetSERIE.AsString);
  CierraData(DMLstPackingList);
end;

procedure TFMPackingList.AEtiquetaPackingListExecute(Sender: TObject);
begin
  AbreData(TDMLstPackingList, DMLstPackingList);
  DMLstPackingList.MostrarEtiquetas(DMPackingList.QMBultosDetID_S.AsInteger, 0, DMPackingList.QMBultosDetSERIE.AsString);
  CierraData(DMLstPackingList);
end;

procedure TFMPackingList.AConfEtiquetaPackingListExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPackingList, DMLstPackingList);

  TFMListConfig.Create(Self).Muestra(635, formato, cabecera, copias, pijama, Serie, DMLstPackingList.frPackingList);

  CierraData(DMLstPackingList);
end;

procedure TFMPackingList.NavBultoClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;

  if (Button = nbPost) then
     LlenarArbol(DMPackingList.QMBultoActualID_B.AsInteger);

  BCalcularVolumen.Visible := (Button = nbEdit);
  VerificaMedidas;
end;

procedure TFMPackingList.AInsertarBultoExecute(Sender: TObject);
var
  TituloBulto : string;
begin
  inherited;
  TituloBulto := '';
  if (StrToIntDef(EContadorBulto.Text, -1) >= 0) then
  begin
     TituloBulto := EContadorBulto.Text;
     EContadorBulto.Text := IntToStr(StrToIntDef(EContadorBulto.Text, 0) + 1);
  end;

  DMPackingList.InsertaBulto(DMPackingList.QMBultoActualID_B.AsInteger, TituloBulto);
  LlenarArbol(DMPackingList.QMBultoActualID_B.AsInteger);
end;

procedure TFMPackingList.DBEFTipoBultoChange(Sender: TObject);
begin
  inherited;
  ETipoBulto.Text := DMPackingList.DameTituloTipoBulto(StrToIntDef(DBEFTipoBulto.Text, 0));
end;

procedure TFMPackingList.TVBultosDragDrop(Sender, Source: TObject; X, Y: integer);
var
  //Src : TTreeNode;
  Dst : TTreeNode;
  // BultoOrigen : integer;
  BultoDestino : integer;
begin
  inherited;

  // No necesito saber el origen porque es el nodo que estoy arrastrando y se habia seleccionado
  // Src := TVBultos.Selected;
  Dst := TVBultos.GetNodeAt(X, Y);

  // No hago nada con el arbol porque lo repintaré completamente.
  // Src.MoveTo(Dst, naAdd);

  // BultoOrigen := DameIdBulto(Src);
  BultoDestino := DameIdBulto(Dst);

  DMPackingList.TraspasaBulto(BultoDestino);

  LlenarArbol(BultoDestino);
end;

procedure TFMPackingList.TVBultosDragOver(Sender, Source: TObject; X, Y: integer; State: TDragState; var Accept: boolean);
var
  Src, Dst : TTreeNode;
begin
  inherited;

  Src := TVBultos.Selected;
  Dst := TVBultos.GetNodeAt(X, Y);

  Accept := Assigned(Dst) and (Src <> Dst);
end;

procedure TFMPackingList.DBGDetalleColEnter(Sender: TObject);
begin
  inherited;
  if DBGDetalle.ColumnaActual = 'NUMERO_BULTO_DET' then
     FMain.AddComponentePunto(DBGDetalle)
  else
     FMain.DelComponentePunto(DBGDetalle);
end;

procedure TFMPackingList.AGenerarSSCCExecute(Sender: TObject);
begin
  inherited;
  DMPackingList.GenerarSSCC(DMPackingList.QMBultoActualID_B.AsInteger);
  LlenarArbol(DMPackingList.QMBultoActualID_B.AsInteger);
end;

procedure TFMPackingList.ADividirEnBultosExecute(Sender: TObject);
begin
  inherited;
  Traspasa(4);
  HabilitaBotones;
end;

procedure TFMPackingList.EFTipoBultoDefectoChange(Sender: TObject);
begin
  inherited;
  ETipoBultoDefecto.Text := DMPackingList.DameTituloTipoBulto(StrToIntDef(EFTipoBultoDefecto.Text, 0));
  DMPackingList.SetTipoBultoDefecto(StrToIntDef(EFTipoBultoDefecto.Text, 0));
end;

procedure TFMPackingList.FormShow(Sender: TObject);
var
  i, IdColumna : integer;
begin
  inherited;
  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGDetalle, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGDetalle.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;
end;

procedure TFMPackingList.ABorrarBultosVaciosExecute(Sender: TObject);
begin
  DMPackingList.BorrarBultosVacios;
  LlenarArbol;
  HabilitaBotones;
end;

procedure TFMPackingList.AEnviarCorreoExecute(Sender: TObject);
var
  Asunto : string;
  DMLstPackingListAbierto : boolean;
  CuerpoMail : TStrings;
  NomFic : string; // Nombre del Fichero y xml
  //NFic : TextFile; // Fichero
begin
  DMLstPackingListAbierto := False;
  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando la packing list por e-mail ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           AbreData(TDMLstPackingList, DMLstPackingList);
           DMLstPackingListAbierto := True;

           DMLstPackingList.MostrarListadoMail(ID_S, 2, Serie);
           NomFic := DameTempPath + DMLstPackingList.rutaFich;

           CierraData(DMLstPackingList);
           DMLstPackingListAbierto := False;

           FSendCorreo.Texto(_('Enviando Packing List  ...'));

           InicializaVariableEmail('PKL');
           with VariableEmail do
           begin
              Ejercicio := Self.Ejercicio;
              Serie := Self.Serie;
              NumeroDocumento := Self.RIG;
              Fecha := Today;
              SuReferencia := '';
              SuPedido := '';
              Folio := '';
              TituloDocTributario := '';
              NombreFichero := NomFic;
              Matricula := '';
              {TODO : Obtener nombres del documento origen y tener en cuenta que puede ser "clientes varios"}
              NombreComercial := DameTituloCliente(Cliente);
              RazonSocial := DameTituloCliente(Cliente);
              OrdenTrabajo := 0;
              UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(REntorno.Entrada));
           end;
           DamePartesEmail(Asunto, CuerpoMail);
           try
              DMListados.SendMailClientePDF(Cliente, CuerpoMail, NomFic, NomFic, Asunto, Tipo, ID_S, True);
           finally
              CuerpoMail.Free;
           end;

           FSendCorreo.Texto(_('Packing list enviado con éxito ...'));
        end;
     except
        on E: Exception do
        begin
           Application.ProcessMessages;
           {dji lrk kri}
           { TODO -oDuilio -cemail : Que muestre el mensaje de excepciones de envio de correo electronico en FAP, ALB, ALP, PEC, PEP, OFC }
           with FSendCorreo do
           begin
              LTexto.AutoSize := True;
              LTexto.Font.Size := 10;
              Texto(_('ERROR!! Error en el envío.') + #13#10 + E.Message);
              BitBtnOk.Top := ClientHeight - BitBtnOk.Height - 4;
              if (LTexto.Width > ClientWidth) then
              begin
                 Width := LTexto.Width + 30;
                 BitBtnOk.Left := (ClientWidth div 2) + (BitBtnOk.Width div 2);
              end;
           end;

           // Liberamos objetos creados
           if DMLstPackingListAbierto then
              CierraData(DMLstPackingList);
        end;
     end;

     FSendCorreo.BitBtnOk.Visible := True;
     Application.ProcessMessages;
     FSendCorreo.Visible := False;
     FSendCorreo.SePuede := True;
     FSendCorreo.ShowModal;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

procedure TFMPackingList.EFArticuloChange(Sender: TObject);
begin
  DMPackingList.PosicionaArticulo(EFArticulo.Text);
end;

procedure TFMPackingList.DBGDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (Column.FieldName = 'ARTICULO') then
        begin
           if (DataSource.DataSet.FieldByName('ARTICULO').AsString = EFArticulo.Text) then
              ColorResaltado3(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPackingList.TVBultosCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: boolean);
//var
//NodeRect : TRect;
begin
  {
  // draw the selection rect.
  if cdsSelected in State then
  begin
     NodeRect := Node.DisplayRect(True);
     TTreeView(Sender).Canvas.FillRect(NodeRect);
  end;
  NodeRect := Node.DisplayRect(False);

  if (PPackingListInfo(Node.Data)^.ContieneArticulo) then
  begin
     Brush.Color := $00800080;
     Brush.Color := clWhite;
     TTreeView(Sender).Canvas.FillRect(NodeRect);
  end;
  }
end;

procedure TFMPackingList.ACrearBultosExecute(Sender: TObject);
var
  IdBultoPadre, CantBultos : integer;
  Prefijo, Titulo : string;
begin
  // Preg cant
  // Crear bultos
  CantBultos := 1;
  Prefijo := '';
  if PideDato('INT', CantBultos, 'Cantidad de Bultos a Crear') then
  begin
     if PideDato('STR', Prefijo, 'Prefijo para descripcion') then
     begin
        IdBultoPadre := DMPackingList.QMBultoActualID_B.AsInteger;
        while CantBultos > 0 do
        begin
           Titulo := '';
           if (Prefijo > '') then
           begin
              Titulo := Prefijo + ' ' + EContadorBulto.Text;
              EContadorBulto.Text := IntToStr(StrToIntDef(EContadorBulto.Text, 0) + 1);
           end;

           DMPackingList.InsertaBulto(IdBultoPadre, Titulo);
           Dec(CantBultos);
        end;

        LlenarArbol(DMPackingList.QMBultoActualID_B.AsInteger);
     end;
  end;
end;

procedure TFMPackingList.VerificaMedidas;
begin
  with DMPackingList do
  begin
     if QMBultoActual.Active then
     begin
        if (abs((QMBultoActualALTO.AsFloat * QMBultoActualANCHO.AsFloat * QMBultoActualFONDO.AsFloat) - QMBultoActualVOLUMEN.AsFloat) > 0.001) then
           ColorError(DBEVolumen)
        else
           ColorEdicion(DBEVolumen);
     end;
  end;
end;

procedure TFMPackingList.BCalcularVolumenClick(Sender: TObject);
begin
  with DMPackingList do
     QMBultoActualVOLUMEN.AsFloat := (QMBultoActualALTO.AsFloat * QMBultoActualANCHO.AsFloat * QMBultoActualFONDO.AsFloat);
  VerificaMedidas;
end;

procedure TFMPackingList.DBENumeroBultoChange(Sender: TObject);
begin
  VerificaMedidas;
end;

procedure TFMPackingList.AAgregarArticulosSinControlStockExecute(Sender: TObject);
begin
  DMPackingList.AgregarArticulosSinControlStock;
  LlenarArbol;
end;

procedure TFMPackingList.ABorrarLineaExecute(Sender: TObject);
var
  IdBultoActual : integer;
begin
  if (ConfirmaMensaje(_('Esta seguro de querer borrar esta linea de todos los bultos del Packing List?'))) then
  begin
     IdBultoActual := DMPackingList.QMBultoActualID_B.AsInteger;
     DMPackingList.BorrarLinea;
     LlenarArbol(IdBultoActual);
  end;
end;

procedure TFMPackingList.PNLEmbarqueResize(Sender: TObject);
begin
  inherited;
  PNLDatosEmbarque.Width := PNLEmbarque.Width div 3;
  PNLDatosEmbarqueDer.Width := PNLEmbarque.Width div 3;
end;

procedure TFMPackingList.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  AInformePackingList.Execute;
end;

end.
