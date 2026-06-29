unit UFPregModelo390;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Grids,
  DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, UHYDBGrid,
  NsDBGrid, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar, ULFLabel,
  ShellApi, HYFIBQuery, TFlatCheckBoxUnit, ULFCheckBox, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple, UNavigator, ULFEdit,
  ULFEditFind2000, Mask, DBCtrls, ULFDBEdit;

type
  TFPregModelo390 = class(TFPEditListadoSimple)
     PNLDatos: TLFPanel;
     LblMod390: TLFLabel;
     TButtConfigurar: TToolButton;
     TButtModeloOficial: TToolButton;
     TButtInstrucciones: TToolButton;
     AmodeloOficial: TAction;
     AInstrucciones: TAction;
     TBExportar: TToolButton;
     AExportarMod390: TAction;
     PCDatosModelo: TLFPageControl;
     TSDatosModelo: TTabSheet;
     TSCasillas: TTabSheet;
     TBCasillas: TLFToolBar;
     NavCasillas: THYMNavigator;
     TSep1: TToolButton;
     TButtRecargarCasillas: TToolButton;
     PCCasillas: TLFPageControl;
     TSCasillas_0103: TTabSheet;
     TSep2: TToolButton;
     PNLPeriodo: TLFPanel;
     EFPeriodo: TLFEditFind2000;
     LPeriodo: TLFLabel;
     EPeriodo: TLFEdit;
     TSCasillas_0406: TTabSheet;
     TSCasillas_0709: TTabSheet;
     TSCasillas_1011: TTabSheet;
     TSCasillas_1213: TTabSheet;
     TSCasillas_1415: TTabSheet;
     TSCasillas_2829: TTabSheet;
     TSCasillas_3031: TTabSheet;
     TSCasillas_3233: TTabSheet;
     TSCasillas_3637: TTabSheet;
     TSCasillas_4041: TTabSheet;
     TSCasillas_59: TTabSheet;
     TSCasillas_60: TTabSheet;
     TSCasillas_61: TTabSheet;
     PCEdicion390: TLFPageControl;
     TSDatosEstadisticos: TTabSheet;
     TSOperacionesRealizadasDevengado: TTabSheet;
     TSResultadoLiquidacionAnual: TTabSheet;
     TSTributacionPorRazonDeTerritorio: TTabSheet;
     TSResultadoLiquidaciones: TTabSheet;
     TSVolumenOperaciones: TTabSheet;
     LC01: TLFLabel;
     DBEC01: TLFDbedit;
     DBEC02: TLFDbedit;
     DBEC03: TLFDbedit;
     DBEC04: TLFDbedit;
     DBEC05: TLFDbedit;
     DBEC06: TLFDbedit;
     DBEC500: TLFDbedit;
     DBEC501: TLFDbedit;
     DBEC502: TLFDbedit;
     DBEC503: TLFDbedit;
     DBEC504: TLFDbedit;
     DBEC505: TLFDbedit;
     DBEC643: TLFDbedit;
     DBEC644: TLFDbedit;
     DBEC646: TLFDbedit;
     DBEC645: TLFDbedit;
     DBEC647: TLFDbedit;
     DBEC648: TLFDbedit;
     DBEC07: TLFDbedit;
     DBEC08: TLFDbedit;
     DBEC09: TLFDbedit;
     DBEC10: TLFDbedit;
     DBEC11: TLFDbedit;
     DBEC12: TLFDbedit;
     DBEC13: TLFDbedit;
     DBEC14: TLFDbedit;
     DBEC21: TLFDbedit;
     DBEC22: TLFDbedit;
     DBEC23: TLFDbedit;
     DBEC24: TLFDbedit;
     DBEC25: TLFDbedit;
     DBEC26: TLFDbedit;
     DBEC545: TLFDbedit;
     DBEC546: TLFDbedit;
     DBEC547: TLFDbedit;
     DBEC548: TLFDbedit;
     DBEC551: TLFDbedit;
     DBEC552: TLFDbedit;
     LC500: TLFLabel;
     LC643: TLFLabel;
     LC07: TLFLabel;
     LC13: TLFLabel;
     LC21: TLFLabel;
     LC545: TLFLabel;
     LC27: TLFLabel;
     DBEC27: TLFDbedit;
     DBEC28: TLFDbedit;
     LC29: TLFLabel;
     DBEC29: TLFDbedit;
     DBEC30: TLFDbedit;
     DBEC650: TLFDbedit;
     DBEC649: TLFDbedit;
     LC649: TLFLabel;
     LC31: TLFLabel;
     DBEC31: TLFDbedit;
     DBEC32: TLFDbedit;
     LC33: TLFLabel;
     DBEC33: TLFDbedit;
     DBEC34: TLFDbedit;
     LC35: TLFLabel;
     DBEC35: TLFDbedit;
     DBEC36: TLFDbedit;
     DBEC599: TLFDbedit;
     DBEC600: TLFDbedit;
     DBEC601: TLFDbedit;
     DBEC602: TLFDbedit;
     DBEC41: TLFDbedit;
     DBEC42: TLFDbedit;
     LC43: TLFLabel;
     DBEC43: TLFDbedit;
     DBEC44: TLFDbedit;
     LC45: TLFLabel;
     DBEC45: TLFDbedit;
     DBEC46: TLFDbedit;
     DBEC47: TLFDbedit;
     LC47: TLFLabel;
     LC658: TLFLabel;
     LC84: TLFLabel;
     LC85: TLFLabel;
     LC86: TLFLabel;
     DBEC658: TLFDbedit;
     DBEC84: TLFDbedit;
     DBEC659: TLFDbedit;
     DBEC85: TLFDbedit;
     LC659: TLFLabel;
     DBEC86: TLFDbedit;
     LC95: TLFLabel;
     LC96: TLFLabel;
     LC97: TLFLabel;
     LC98: TLFLabel;
     DBEC95: TLFDbedit;
     DBEC96: TLFDbedit;
     DBEC524: TLFDbedit;
     DBEC97: TLFDbedit;
     LC524: TLFLabel;
     DBEC98: TLFDbedit;
     DBEC662: TLFDbedit;
     LC662: TLFLabel;
     DBEC525: TLFDbedit;
     LC525: TLFLabel;
     DBEC526: TLFDbedit;
     LC526: TLFLabel;
     LC99: TLFLabel;
     LC653: TLFLabel;
     LC104: TLFLabel;
     LC105: TLFLabel;
     DBEC99: TLFDbedit;
     DBEC653: TLFDbedit;
     DBEC103: TLFDbedit;
     DBEC104: TLFDbedit;
     LC103: TLFLabel;
     DBEC105: TLFDbedit;
     DBEC110: TLFDbedit;
     LC110: TLFLabel;
     DBEC112: TLFDbedit;
     LC112: TLFLabel;
     DBEC100: TLFDbedit;
     LC100: TLFLabel;
     LC101: TLFLabel;
     LC102: TLFLabel;
     LC228: TLFLabel;
     LC106: TLFLabel;
     DBEC101: TLFDbedit;
     DBEC102: TLFDbedit;
     DBEC227: TLFDbedit;
     DBEC228: TLFDbedit;
     LC227: TLFLabel;
     DBEC106: TLFDbedit;
     DBEC107: TLFDbedit;
     LC107: TLFLabel;
     DBEC108: TLFDbedit;
     LC108: TLFLabel;
     LC87: TLFLabel;
     LC88: TLFLabel;
     LC90: TLFLabel;
     LC91: TLFLabel;
     DBEC87: TLFDbedit;
     DBEC88: TLFDbedit;
     DBEC89: TLFDbedit;
     DBEC90: TLFDbedit;
     LC89: TLFLabel;
     DBEC91: TLFDbedit;
     LC658_2: TLFLabel;
     LC84_2: TLFLabel;
     LC659_2: TLFLabel;
     LC93: TLFLabel;
     DBEC658_2: TLFDbedit;
     DBEC84_2: TLFDbedit;
     DBEC92: TLFDbedit;
     DBEC659_2: TLFDbedit;
     LC92: TLFLabel;
     DBEC93: TLFDbedit;
     DBEC94: TLFDbedit;
     LC94: TLFLabel;
     LActividadPrincipal: TLFLabel;
     EActividadPrincipal: TLFEdit;
     LActividadClave: TLFLabel;
     LActividadEpigrafe: TLFLabel;
     EActiviadClave: TLFEdit;
     EActividadEpigrafe: TLFEdit;
     CBActividadOperacionesConTercerasPersonas: TLFCheckBox;
     EActividad2: TLFEdit;
     EActividad3: TLFEdit;
     EActividad4: TLFEdit;
     EActividad5: TLFEdit;
     EActividad6: TLFEdit;
     LActividadOtras: TLFLabel;
     TSOperacionesRealizadasDeducible: TTabSheet;
     LC60: TLFLabel;
     LC660: TLFLabel;
     LC639: TLFLabel;
     LC651: TLFLabel;
     LC63: TLFLabel;
     LC522: TLFLabel;
     LC64: TLFLabel;
     LC65: TLFLabel;
     DBEC60: TLFDbedit;
     DBEC61: TLFDbedit;
     DBEC660: TLFDbedit;
     DBEC661: TLFDbedit;
     DBEC639: TLFDbedit;
     DBEC62: TLFDbedit;
     DBEC651: TLFDbedit;
     DBEC652: TLFDbedit;
     DBEC63: TLFDbedit;
     DBEC522: TLFDbedit;
     DBEC64: TLFDbedit;
     DBEC65: TLFDbedit;
     LFLabel1: TLFLabel;
     LFLabel2: TLFLabel;
     LFLabel3: TLFLabel;
     LFLabel4: TLFLabel;
     LFLabel5: TLFLabel;
     LFLabel6: TLFLabel;
     LFLabel7: TLFLabel;
     LFLabel8: TLFLabel;
     LFLabel9: TLFLabel;
     LFLabel10: TLFLabel;
     LFLabel11: TLFLabel;
     LFLabel12: TLFLabel;
     LFLabel13: TLFLabel;
     LFLabel14: TLFLabel;
     LFLabel15: TLFLabel;
     LC190: TLFLabel;
     DBEC190: TLFDbedit;
     DBEC191: TLFDbedit;
     DBEC603: TLFDbedit;
     DBEC604: TLFDbedit;
     DBEC605: TLFDbedit;
     DBEC606: TLFDbedit;
     LC603: TLFLabel;
     LC605: TLFLabel;
     LC48: TLFLabel;
     DBEC48: TLFDbedit;
     DBEC49: TLFDbedit;
     LC506: TLFLabel;
     DBEC506: TLFDbedit;
     DBEC507: TLFDbedit;
     DBEC607: TLFDbedit;
     DBEC608: TLFDbedit;
     DBEC609: TLFDbedit;
     DBEC610: TLFDbedit;
     LC607: TLFLabel;
     LC609: TLFLabel;
     LC512: TLFLabel;
     DBEC512: TLFDbedit;
     DBEC513: TLFDbedit;
     LFLabel16: TLFLabel;
     DBEC196: TLFDbedit;
     DBEC197: TLFDbedit;
     DBEC611: TLFDbedit;
     DBEC612: TLFDbedit;
     DBEC613: TLFDbedit;
     DBEC614: TLFDbedit;
     LFLabel17: TLFLabel;
     LFLabel18: TLFLabel;
     LFLabel19: TLFLabel;
     DBEC50: TLFDbedit;
     DBEC51: TLFDbedit;
     LC514: TLFLabel;
     DBEC514: TLFDbedit;
     DBEC515: TLFDbedit;
     DBEC615: TLFDbedit;
     DBEC616: TLFDbedit;
     DBEC617: TLFDbedit;
     DBEC618: TLFDbedit;
     LC615: TLFLabel;
     LC617: TLFLabel;
     LC520: TLFLabel;
     DBEC520: TLFDbedit;
     DBEC521: TLFDbedit;
     LC202: TLFLabel;
     DBEC202: TLFDbedit;
     DBEC203: TLFDbedit;
     DBEC619: TLFDbedit;
     DBEC620: TLFDbedit;
     DBEC621: TLFDbedit;
     DBEC622: TLFDbedit;
     LC619: TLFLabel;
     LC621: TLFLabel;
     LC52: TLFLabel;
     DBEC52: TLFDbedit;
     DBEC53: TLFDbedit;
     LC208: TLFLabel;
     DBEC208: TLFDbedit;
     DBEC209: TLFDbedit;
     DBEC623: TLFDbedit;
     DBEC624: TLFDbedit;
     DBEC625: TLFDbedit;
     DBEC626: TLFDbedit;
     LC623: TLFLabel;
     LC625: TLFLabel;
     LC54: TLFLabel;
     DBEC54: TLFDbedit;
     DBEC55: TLFDbedit;
     LFLabel20: TLFLabel;
     DBEC214: TLFDbedit;
     DBEC215: TLFDbedit;
     DBEC627: TLFDbedit;
     DBEC628: TLFDbedit;
     DBEC629: TLFDbedit;
     DBEC630: TLFDbedit;
     LFLabel21: TLFLabel;
     LFLabel22: TLFLabel;
     LFLabel23: TLFLabel;
     DBEC56: TLFDbedit;
     DBEC57: TLFDbedit;
     LFLabel24: TLFLabel;
     DBEC220: TLFDbedit;
     DBEC221: TLFDbedit;
     DBEC631: TLFDbedit;
     DBEC632: TLFDbedit;
     DBEC633: TLFDbedit;
     DBEC634: TLFDbedit;
     LFLabel25: TLFLabel;
     LFLabel26: TLFLabel;
     LFLabel27: TLFLabel;
     DBEC58: TLFDbedit;
     DBEC59: TLFDbedit;
     LC587: TLFLabel;
     DBEC587: TLFDbedit;
     DBEC588: TLFDbedit;
     DBEC635: TLFDbedit;
     DBEC636: TLFDbedit;
     DBEC637: TLFDbedit;
     DBEC638: TLFDbedit;
     LC635: TLFLabel;
     LC637: TLFLabel;
     LC597: TLFLabel;
     DBEC597: TLFDbedit;
     DBEC598: TLFDbedit;
     TSOperacionesEspecificas: TTabSheet;
     LFLabel28: TLFLabel;
     LFLabel29: TLFLabel;
     LFLabel30: TLFLabel;
     LFLabel31: TLFLabel;
     LFLabel32: TLFLabel;
     LFLabel33: TLFLabel;
     LFLabel34: TLFLabel;
     DBEC230: TLFDbedit;
     DBEC109: TLFDbedit;
     DBEC231: TLFDbedit;
     DBEC232: TLFDbedit;
     DBEC111: TLFDbedit;
     DBEC113: TLFDbedit;
     DBEC523: TLFDbedit;
     LC654: TLFLabel;
     DBEC654: TLFDbedit;
     DBEC655: TLFDbedit;
     LC656: TLFLabel;
     DBEC656: TLFDbedit;
     DBEC657: TLFDbedit;
     TSProrrata: TTabSheet;
     LFLabel35: TLFLabel;
     EProrrataActividad: TLFEdit;
     LC114: TLFLabel;
     DBEC114: TLFDbedit;
     DBEC115: TLFDbedit;
     LC115: TLFLabel;
     DBEC116: TLFDbedit;
     LC116: TLFLabel;
     LC117: TLFLabel;
     DBEC117: TLFDbedit;
     DBEC118: TLFDbedit;
     LC118: TLFLabel;
     TBCasillas2: TLFToolBar;
     NavCasillas2: THYMNavigator;
     LC125: TLFLabel;
     DBEC125: TLFDbedit;
     LC126: TLFLabel;
     DBEC126: TLFDbedit;
     LC127: TLFLabel;
     DBEC127: TLFDbedit;
     LC128: TLFLabel;
     DBEC128: TLFDbedit;
     LC700: TLFLabel;
     DBEC700: TLFDbedit;
     DBEC701: TLFDbedit;
     LC702: TLFLabel;
     DBEC702: TLFDbedit;
     DBEC703: TLFDbedit;
     LC704: TLFLabel;
     DBEC704: TLFDbedit;
     DBEC705: TLFDbedit;
     LC706: TLFLabel;
     DBEC706: TLFDbedit;
     DBEC707: TLFDbedit;
     DBEC708: TLFDbedit;
     DBEC709: TLFDbedit;
     LC710: TLFLabel;
     DBEC710: TLFDbedit;
     DBEC711: TLFDbedit;
     LC708: TLFLabel;
     LC712: TLFLabel;
     DBEC712: TLFDbedit;
     DBEC713: TLFDbedit;
     LC714: TLFLabel;
     DBEC714: TLFDbedit;
     DBEC715: TLFDbedit;
     LC716: TLFLabel;
     DBEC716: TLFDbedit;
     DBEC717: TLFDbedit;
     LC718: TLFLabel;
     DBEC718: TLFDbedit;
     DBEC719: TLFDbedit;
     LC720: TLFLabel;
     DBEC720: TLFDbedit;
     DBEC721: TLFDbedit;
     LC722: TLFLabel;
     DBEC722: TLFDbedit;
     DBEC723: TLFDbedit;
     LC724: TLFLabel;
     DBEC724: TLFDbedit;
     DBEC725: TLFDbedit;
     LC726: TLFLabel;
     DBEC726: TLFDbedit;
     DBEC727: TLFDbedit;
     LC728: TLFLabel;
     DBEC728: TLFDbedit;
     DBEC729: TLFDbedit;
     LC730: TLFLabel;
     DBEC730: TLFDbedit;
     DBEC731: TLFDbedit;
     LC732: TLFLabel;
     DBEC732: TLFDbedit;
     DBEC733: TLFDbedit;
     LC734: TLFLabel;
     DBEC734: TLFDbedit;
     DBEC735: TLFDbedit;
     LC736: TLFLabel;
     DBEC736: TLFDbedit;
     DBEC737: TLFDbedit;
     LC738: TLFLabel;
     DBEC738: TLFDbedit;
     DBEC739: TLFDbedit;
     LC740: TLFLabel;
     DBEC740: TLFDbedit;
     DBEC741: TLFDbedit;
     LC663: TLFLabel;
     DBEC663: TLFDbedit;
     DBEC664: TLFDbedit;
     LC665: TLFLabel;
     DBEC665: TLFDbedit;
     DBEC666: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AmodeloOficialExecute(Sender: TObject);
     procedure AInstruccionesExecute(Sender: TObject);
     procedure AExportarMod390Execute(Sender: TObject);
     procedure TSCasillas_0103Show(Sender: TObject);
     procedure TSCasillasShow(Sender: TObject);
     procedure EFPeriodoChange(Sender: TObject);
     procedure TButtRecargarCasillasClick(Sender: TObject);
     procedure TSCasillas_0406Show(Sender: TObject);
     procedure TSCasillas_0709Show(Sender: TObject);
     procedure TSCasillas_1011Show(Sender: TObject);
     procedure TSCasillas_1213Show(Sender: TObject);
     procedure TSCasillas_1415Show(Sender: TObject);
     procedure TSCasillas_2829Show(Sender: TObject);
     procedure TSCasillas_3031Show(Sender: TObject);
     procedure TSCasillas_3233Show(Sender: TObject);
     procedure TSCasillas_3637Show(Sender: TObject);
     procedure TSCasillas_4041Show(Sender: TObject);
     procedure TSCasillas_59Show(Sender: TObject);
     procedure TSCasillas_60Show(Sender: TObject);
     procedure TSCasillas_61Show(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
     TituloFormulario: string;
  public
     { Public declarations }
  end;

var
  FPregModelo390 : TFPregModelo390;

implementation

uses UDMRModelosHacienda, UFormGest, UDMMain, UFMListConfig, UEntorno, UDameDato;

{$R *.DFM}

procedure TFPregModelo390.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRModelosHacienda, DMRModelosHacienda);

  TituloFormulario := _('MODELO 390. IVA');
  LblMod390.Caption := TituloFormulario + ' - ' + _('NO ACTUALIZADO');

  Grupo := 657;
  Listado := DMRModelosHacienda.frModelo390;
  ListadoFR3 := DMRModelosHacienda.frxModelo390;
  EFPeriodo.Text := '19';

  PCDatosModelo.ActivePage := TSDatosModelo;
  PCEdicion390.ActivePage := TSDatosEstadisticos;
  DMRModelosHacienda.QMModelo390.Open;
end;

procedure TFPregModelo390.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRModelosHacienda);
end;

procedure TFPregModelo390.FormShow(Sender: TObject);
begin
  inherited;
  TSCasillas.TabVisible := False;
end;

procedure TFPregModelo390.APrevExecute(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.Previsualizar390(0, EActividadPrincipal.Text, EActiviadClave.Text, EActividadEpigrafe.Text, EActividad2.Text, EActividad3.Text, EActividad4.Text, EActividad5.Text, EActividad6.Text, CBActividadOperacionesConTercerasPersonas.Checked, EProrrataActividad.Text);
end;

procedure TFPregModelo390.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.Previsualizar390(1, EActividadPrincipal.Text, EActiviadClave.Text, EActividadEpigrafe.Text, EActividad2.Text, EActividad3.Text, EActividad4.Text, EActividad5.Text, EActividad6.Text, CBActividadOperacionesConTercerasPersonas.Checked, EProrrataActividad.Text);
end;

procedure TFPregModelo390.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.ReCalcular390;
  LblMod390.Caption := TituloFormulario;
end;

procedure TFPregModelo390.AmodeloOficialExecute(Sender: TObject);
begin
  DMRModelosHacienda.GeneraModeloOficial_390;
end;

procedure TFPregModelo390.AInstruccionesExecute(Sender: TObject);
begin
  {dji lrk kri - Cambio la ruta, relativa al exe}
  if ShellExecute(Application.Handle, nil, PChar(REntorno.RutaEXE + 'ModelosHacienda\instr_390.pdf'), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la búsqueda de la ayuda'));
end;

procedure TFPregModelo390.AExportarMod390Execute(Sender: TObject);
begin
  DMRModelosHacienda.ExportarMod390(EActividadPrincipal.Text, EActiviadClave.Text, EActividadEpigrafe.Text, EProrrataActividad.Text);
end;

procedure TFPregModelo390.TSCasillasShow(Sender: TObject);
begin
  inherited;
  // DMRModelosHacienda.AbreCasillasModelo390(EFPeriodo.Text);
end;

procedure TFPregModelo390.EFPeriodoChange(Sender: TObject);
begin
  inherited;
  EPeriodo.Text := DameTituloPeriodo(EFPeriodo.Text);
  // DMRModelosHacienda.AbreCasillasModelo390(EFPeriodo.Text);
end;

procedure TFPregModelo390.TButtRecargarCasillasClick(Sender: TObject);
begin
  inherited;
  // DMRModelosHacienda.AbreCasillasModelo390(EFPeriodo.Text);
end;

procedure TFPregModelo390.TSCasillas_0103Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C0103;
end;

procedure TFPregModelo390.TSCasillas_0406Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C0406;
end;

procedure TFPregModelo390.TSCasillas_0709Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C0709;
end;

procedure TFPregModelo390.TSCasillas_1011Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C1011;
end;

procedure TFPregModelo390.TSCasillas_1213Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C1213;
end;

procedure TFPregModelo390.TSCasillas_1415Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C1415;
end;

procedure TFPregModelo390.TSCasillas_2829Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C2829;
end;

procedure TFPregModelo390.TSCasillas_3031Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C3031;
end;

procedure TFPregModelo390.TSCasillas_3233Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C3233;
end;

procedure TFPregModelo390.TSCasillas_3637Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C3637;
end;

procedure TFPregModelo390.TSCasillas_4041Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C4041;
end;

procedure TFPregModelo390.TSCasillas_59Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C59;
end;

procedure TFPregModelo390.TSCasillas_60Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C60;
end;

procedure TFPregModelo390.TSCasillas_61Show(Sender: TObject);
begin
  inherited;
  // NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo390_C61;
end;

end.
