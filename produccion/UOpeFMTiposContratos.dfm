inherited OpeFMTiposContratos: TOpeFMTiposContratos
  Left = 387
  Top = 327
  Caption = 'Mantenimiento de tipo de contrato'
  ClientHeight = 246
  ClientWidth = 418
  PopupMenu = CENotasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 418
    Height = 222
    inherited TBMain: TLFToolBar
      Width = 414
      inherited NavMain: THYMNavigator
        DataSource = OpeDMTiposContratos.DSQMTipoContratos
        Hints.Strings = ()
        EditaControl = DBEDescrip
        InsertaControl = DBEContrato
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      Width = 414
      Height = 192
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 406
          Height = 164
          inherited G2KTableLoc: TG2KTBLoc
            Top = 32
            DataSource = OpeDMTiposContratos.DSQMTipoContratos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'OPE_SYS_TIPOS_CONTRATOS'
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LTipo: TLFLabel
            Left = 35
            Top = 43
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
            FocusControl = DBEContrato
          end
          object LDescripcion: TLFLabel
            Left = 17
            Top = 65
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descrip.'
            FocusControl = DBEDescrip
          end
          object LHorasPorMes: TLFLabel
            Left = 249
            Top = 42
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'H. al mes'
            FocusControl = DBEMes
          end
          object DBEContrato: TLFDbedit
            Left = 59
            Top = 38
            Width = 41
            Height = 21
            DataField = 'TIPO'
            DataSource = OpeDMTiposContratos.DSQMTipoContratos
            TabOrder = 0
          end
          object DBEDescrip: TLFDbedit
            Left = 59
            Top = 60
            Width = 303
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = OpeDMTiposContratos.DSQMTipoContratos
            TabOrder = 1
          end
          object DBEMes: TLFDbedit
            Left = 298
            Top = 38
            Width = 64
            Height = 21
            DataField = 'HORAS_MES'
            DataSource = OpeDMTiposContratos.DSQMTipoContratos
            TabOrder = 2
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        PopupMenu = CENotasPMEdit
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 406
          Height = 26
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          PopupMenu = CENotasPMEdit
          TabOrder = 0
          Separators = True
          object PInforma: TLFPanel
            Left = 0
            Top = 0
            Width = 300
            Height = 22
            BevelOuter = bvNone
            TabOrder = 0
            object LTipoNotas: TLFLabel
              Left = 23
              Top = 4
              Width = 21
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo'
            end
            object DBEContratoNotas: TLFDbedit
              Left = 48
              Top = 1
              Width = 38
              Height = 21
              Color = clInfoBk
              DataField = 'TIPO'
              DataSource = OpeDMTiposContratos.DSQMTipoContratos
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEDescripcionNotas: TLFDbedit
              Left = 87
              Top = 1
              Width = 210
              Height = 21
              Color = clInfoBk
              DataField = 'DESCRIPCION'
              DataSource = OpeDMTiposContratos.DSQMTipoContratos
              Enabled = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object NavNotas: THYMNavigator
            Left = 300
            Top = 0
            Width = 80
            Height = 22
            DataSource = OpeDMTiposContratos.DSQMTipoContratos
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMNotas
            Exclusivo = False
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNotas: TLFPanel
          Left = 0
          Top = 26
          Width = 406
          Height = 138
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          PopupMenu = CENotasPMEdit
          TabOrder = 1
          object DBMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 406
            Height = 138
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            DataField = 'ESPECIFICACIONES'
            DataSource = OpeDMTiposContratos.DSQMTipoContratos
            PopupMenu = CENotasPMEdit
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 406
          Height = 164
          DataSource = OpeDMTiposContratos.DSQMTipoContratos
          CamposAOrdenar.Strings = (
            'CONTRATO'
            'DESCRIPCION'
            'HORAS_MES')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 252
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORAS_MES'
              Width = 53
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 222
    Width = 418
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CENotas
    Left = 320
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 356
    Top = 12
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 384
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 134
    Top = 90
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNotas
    Complementario = TBMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 226
    Top = 18
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 256
    Top = 16
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
