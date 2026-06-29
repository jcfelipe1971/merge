inherited FMNotas: TFMNotas
  Left = 656
  Top = 163
  Caption = 'Notas'
  ClientHeight = 478
  ClientWidth = 681
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 681
    Height = 251
    inherited TBMain: TLFToolBar
      Width = 677
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = DMNotas.DSQMNotas
        Hints.Strings = ()
        EditaControl = DBFecha
        InsertaControl = DBFecha
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 24
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 232
      end
      inherited TbuttComp: TToolButton
        Left = 240
      end
      object BRenumera: TToolButton
        Left = 263
        Top = 0
        Hint = 'Renumera las Notas'
        ImageIndex = 122
        OnClick = BRenumeraClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 677
      Height = 221
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 669
          Height = 193
          ParentFont = False
          object DBMNotas: TLFDBMemo
            Left = 0
            Top = 29
            Width = 669
            Height = 164
            Align = alClient
            DataField = 'NOTA'
            DataSource = DMNotas.DSQMNotas
            TabOrder = 0
          end
          object PNLDatosAsiento: TLFPanel
            Left = 0
            Top = 0
            Width = 669
            Height = 29
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object LBLNota: TLFLabel
              Left = 17
              Top = 8
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nota'
            end
            object LBLFecha: TLFLabel
              Left = 146
              Top = 8
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
            end
            object LBLAsiento: TLFLabel
              Left = 321
              Top = 8
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Asiento'
            end
            object DBNota: TLFDbedit
              Left = 44
              Top = 4
              Width = 77
              Height = 21
              Color = clInfoBk
              DataField = 'NUMERO_NOTA'
              DataSource = DMNotas.DSQMNotas
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBFecha: TLFDbedit
              Left = 180
              Top = 4
              Width = 133
              Height = 21
              DataField = 'FECHA'
              DataSource = DMNotas.DSQMNotas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBCHKVisible: TLFDBCheckBox
              Left = 500
              Top = 7
              Width = 97
              Height = 16
              Caption = 'Visible'
              ClicksDisabled = False
              ColorCheck = 57088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'VISIBLE'
              DataSource = DMNotas.DSQMNotas
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBAsiento: TLFDbedit
              Left = 360
              Top = 4
              Width = 129
              Height = 21
              Color = clInfoBk
              DataField = 'ASIENTO'
              DataSource = DMNotas.DSQMNotas
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 669
          Height = 193
          DataSource = DMNotas.DSQMNotas
          Columns = <
            item
              Expanded = False
              FieldName = 'NUMERO_NOTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTA_TEXTO'
              Width = 388
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar [1]
    Top = 454
    Width = 681
    EdgeBorders = []
  end
  inherited PDetalle: TLFPanel [2]
    Top = 251
    Width = 681
    Height = 203
    inherited TBDetalle: TLFToolBar
      Width = 681
      EdgeInner = esNone
      EdgeOuter = esNone
      inherited NavDetalle: THYMNavigator
        Width = 234
        DataSource = DMNotas.DSQMNotasDetalle
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        Exclusivo = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 681
      Height = 181
      DataSource = DMNotas.DSQMNotasDetalle
      OnColEnter = DBGFDetalleColEnter
      IniStorage = FSMain
      Campos.Strings = (
        'CUENTA')
      CamposAMostrar.Strings = (
        'CUENTA'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        'CUENTA')
      CamposDesplegar.Strings = (
        '1')
      CamposAOrdernar.Strings = (
        'CUENTA'
        'ID_NOTA'
        'PGC'
        'TITULO')
      CamposNoAccesibles.Strings = (
        'PGC'
        'ID_NOTA'
        'CUENTA')
      CamposNoAccMenosAlIns.Strings = (
        'CUENTA')
      Numericos.Strings = (
        'CUENTA')
      Tablas.Strings = (
        'VER_CON_CUENTAS_ASIENTOS')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        '')
      OrdenadosPor.Strings = (
        'CUENTA')
      Columns = <
        item
          Expanded = False
          FieldName = 'CUENTA'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 365
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    Complementario = PDetalle
    Left = 384
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 436
    Top = 12
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 344
    Top = 16
  end
  inherited FSMain: TLFFibFormStorage
    Left = 464
    Top = 8
  end
  inherited CEDetalle: TControlEdit
    Left = 400
    Top = 112
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 440
    Top = 120
    inherited CEDetalleMiedit: TMenuItem
      Visible = False
    end
  end
end
