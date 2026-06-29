inherited FMTarFamPropagacion: TFMTarFamPropagacion
  Left = 445
  Top = 346
  HelpContext = 132
  Caption = 'Propagaci'#243'n Tarifas-Familias'
  ClientHeight = 375
  ClientWidth = 504
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 351
    inherited TBMain: TLFToolBar
      Width = 500
      TabOrder = 4
      object PNLTitulo: TLFPanel [0]
        Left = 0
        Top = 0
        Width = 276
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LFamTar: TLFLabel
          Left = 16
          Top = 4
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Familia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DBEBusca: TLFDbedit
          Left = 116
          Top = 0
          Width = 158
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMTarFamPropagacion.DSxBusc
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
        object DBLCBCabecera: TDBLookupComboBox
          Left = 59
          Top = 0
          Width = 56
          Height = 21
          DragKind = dkDock
          DropDownWidth = 250
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'CODIGO ;TITULO'
          ListSource = DMTarFamPropagacion.DSxBusc
          ParentFont = False
          TabOrder = 1
        end
      end
      object TSep1: TToolButton [1]
        Left = 276
        Top = 0
        Width = 1
        Style = tbsSeparator
      end
      object NavMain: THYMNavigator [2]
        Left = 277
        Top = 0
        Width = 88
        Height = 22
        DataSource = DMTarFamPropagacion.DSxBusc
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 1
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      object TSep4: TToolButton [3]
        Left = 365
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtPropagaTodo: TToolButton [4]
        Left = 373
        Top = 0
        Hint = 'Propaga todas las familias en todas las tarifas'
        Caption = 'Propaga Todo'
        ImageIndex = 19
        OnClick = TButtPropagaTodoClick
      end
      object TButCambiaSeleccion: TToolButton [5]
        Left = 396
        Top = 0
        Caption = 'Cambia Selecci'#243'n'
        ImageIndex = 98
        OnClick = TButCambiaSeleccionClick
      end
      inherited EPMain: THYMEditPanel
        Left = 419
        Width = 23
        DataSource = DMTarFamPropagacion.DSxBusc
        VisibleButtons = [neSalir]
        Hints.Strings = (
          'Buscar'
          'B'#250'squeda aproximada'
          'B'#250'squeda exacta'
          'Imprime pantalla'
          'Filtra rango'
          'Imprime report'
          'Copiar'
          'Cortar'
          'Cambiar Selecci'#243'n'
          'Cerrar la ventana')
      end
    end
    object DBGDer: TDBGrid
      Left = 253
      Top = 47
      Width = 249
      Height = 302
      Align = alClient
      DataSource = DMTarFamPropagacion.DSxDere
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGDerDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 177
          Visible = True
        end>
    end
    object DBGIzq: TDBGrid
      Left = 2
      Top = 47
      Width = 251
      Height = 302
      Align = alLeft
      DataSource = DMTarFamPropagacion.DSxIzqu
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGIzqDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 177
          Visible = True
        end>
    end
    object TBDatos: TLFToolBar
      Left = 2
      Top = 47
      Width = 500
      Height = 0
      AutoSize = True
      EdgeBorders = [ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 2
      Separators = True
      object TSep2: TToolButton
        Left = 0
        Top = 2
        Width = 8
        Style = tbsSeparator
      end
    end
    object PTitulo: TLFPanel
      Left = 2
      Top = 28
      Width = 500
      Height = 19
      Align = alTop
      BevelOuter = bvNone
      Color = clAppWorkSpace
      TabOrder = 3
      object LNo: TLFLabel
        Left = 14
        Top = 3
        Width = 88
        Height = 13
        Caption = 'No Propagadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LSi: TLFLabel
        Left = 266
        Top = 3
        Width = 68
        Height = 13
        Caption = 'Propagadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 351
    Width = 504
  end
  inherited CEMain: TControlEdit
    Left = 322
    Top = 104
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMirefresh: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
