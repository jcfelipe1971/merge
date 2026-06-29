inherited CrmFMCorreos: TCrmFMCorreos
  Left = 337
  Top = 285
  Height = 358
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Correos Electr'#243'nicos (E-Mails)'
  Constraints.MinHeight = 358
  Constraints.MinWidth = 512
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 305
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Width = 198
        DataSource = CrmDMCorreos.DSQMCabecera
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBChkBActivo
        InsertaControl = DBEDirEMail
      end
      inherited TSepNav: TToolButton
        Left = 198
      end
      inherited EPMain: THYMEditPanel
        Left = 206
        Width = 66
        DataSource = CrmDMCorreos.DSQMCabecera
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEDirEMail
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 272
      end
      inherited TbuttComp: TToolButton
        Left = 280
        ImageIndex = 42
      end
    end
    inherited PCMain: TLFPageControl
      Height = 275
      PopupMenu = CEDetallePMEdit
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 41
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = CrmDMCorreos.DSQMCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CRM_SYS_EMAILS'
            CampoNum = 'ID_EMAIL'
            CampoStr = 'DIRECCION_EMAIL'
          end
          object LblEMail: TLFLabel
            Left = 15
            Top = 11
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'E-Mail'
          end
          object DBChkBActivo: TLFDBCheckBox
            Left = 431
            Top = 9
            Width = 49
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = CrmDMCorreos.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEIdEmail: TLFDbedit
            Left = 48
            Top = 7
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_EMAIL'
            DataSource = CrmDMCorreos.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEDirEMail: TLFDbedit
            Left = 114
            Top = 7
            Width = 300
            Height = 21
            DataField = 'DIRECCION_EMAIL'
            DataSource = CrmDMCorreos.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
        object pDetalle: TLFPanel
          Left = 0
          Top = 41
          Width = 490
          Height = 206
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 0
            Width = 490
            Height = 24
            AutoSize = True
            EdgeInner = esNone
            EdgeOuter = esNone
            TabOrder = 0
            Separators = True
            object NavDetalle: THYMNavigator
              Left = 0
              Top = 2
              Width = 198
              Height = 22
              DataSource = CrmDMCorreos.DSQMDetalle
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = CEDetallePMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              InsertaControl = DBGFDetalle
              Exclusivo = True
              ControlEdit = CEDetalle
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGFDetalle: TDBGridFind2000
            Left = 0
            Top = 24
            Width = 490
            Height = 182
            Align = alClient
            Ctl3D = True
            DataSource = CrmDMCorreos.DSQMDetalle
            ParentCtl3D = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'AMBITO')
            CamposAMostrar.Strings = (
              'AMBITO'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0'
              '0'
              '0'
              '0')
            CamposADevolver.Strings = (
              'AMBITO')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'AMBITO')
            CamposNoAccesibles.Strings = (
              'ID_EMAIL')
            MensajeNoExiste = False
            Numericos.Strings = (
              'AMBITO')
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tablas.Strings = (
              'CRM_SYS_AMBITOS')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'DESCRIPCION')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'AMBITO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'AMBITO'
                Width = 57
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'Descripci'#243'n'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Width = 389
                Visible = True
              end>
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 247
          DataSource = CrmDMCorreos.DSQMCabecera
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'ID_EMAIL'
            'DIRECCION_EMAIL')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_EMAIL'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIRECCION_EMAIL'
              Width = 338
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 50
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 305
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 421
    Top = 238
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 450
    Top = 238
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 336
    Top = 265
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AImportar: TAction
      Category = 'Procesos'
      Caption = 'Importar E-Mails'
      Hint = 'Importar E-Mails'
      ImageIndex = 49
      OnExecute = AImportarExecute
    end
    object AExportar: TAction
      Category = 'Procesos'
      Caption = 'Exportar E-Mails'
      Hint = 'Exportar E-Mails'
      ImageIndex = 36
      OnExecute = AExportarExecute
    end
    object AImportarContactos: TAction
      Category = 'Procesos'
      Caption = 'Importar Mails Contactos'
      Hint = 'Importar Mails Contactos CRM'
      ImageIndex = 43
      OnExecute = AImportarPersonasExecute
    end
    object AImportarPersonas: TAction
      Category = 'Procesos'
      Caption = 'Importar Mails Personas'
      Hint = 'Importar Mails Contactos y Personas CRM'
      ImageIndex = 43
      OnExecute = AImportarPersonasExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 366
    Top = 265
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 421
    Top = 267
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 450
    Top = 267
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
