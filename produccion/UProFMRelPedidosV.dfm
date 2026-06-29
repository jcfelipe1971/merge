inherited ProFMRelPedidosV: TProFMRelPedidosV
  Left = 380
  Top = 185
  BorderStyle = bsDialog
  Caption = 'Relaci'#243'n con pedidos de escandallo'
  ClientHeight = 289
  ClientWidth = 504
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 265
    inherited TBMain: TLFToolBar
      Width = 500
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TBGenerar: TToolButton
        Left = 25
        Top = 0
        Hint = 'Generar Escandallo'
        ImageIndex = 94
        ParentShowHint = False
        ShowHint = True
        OnClick = TBGenerarClick
      end
    end
    object PNLBuscar: TLFPanel
      Left = 2
      Top = 28
      Width = 500
      Height = 235
      Align = alClient
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object LblBusca: TLFLabel
        Left = 16
        Top = 150
        Width = 186
        Height = 13
        Caption = 'Buscar plantilla para escandallo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblPlantilla: TLFLabel
        Left = 17
        Top = 189
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Plantilla'
      end
      object LBarraEstado: TLFLabel
        Left = 0
        Top = 222
        Width = 500
        Height = 13
        Align = alBottom
        Caption = 'Escandallo'
      end
      object EFSelecc: TEditFind2000
        Left = 57
        Top = 185
        Width = 53
        Height = 21
        TabOrder = 0
        OnChange = EFSeleccChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO'
          'VERSION_ESCANDALLO')
        CampoNum = 'ESCANDALLO'
        CampoStr = 'COMPUESTO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_PRO_ESCANDALLO_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFSeleccBusqueda
        OrdenadoPor.Strings = (
          'ESCANDALLO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object LFDescSelecc: TLFDbedit
        Left = 183
        Top = 185
        Width = 280
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ProDMRelPedidosV.DSEscandallo
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
      object LFDArticle: TLFDbedit
        Left = 111
        Top = 185
        Width = 71
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'COMPUESTO'
        DataSource = ProDMRelPedidosV.DSEscandallo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object PnlSelec: TLFPanel
        Left = 0
        Top = 0
        Width = 500
        Height = 142
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object LblSelec: TLFLabel
          Left = 0
          Top = 0
          Width = 500
          Height = 13
          Align = alTop
          Caption = 'Seleccionar tipo creaci'#243'n escandallo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RBSeleccionar: TRadioGroup
          Left = 24
          Top = 33
          Width = 185
          Height = 84
          Caption = 'Tipo Escandallo'
          Items.Strings = (
            'Crear nuevo escandallo'
            'Duplicar escandallo'
            'Reasignar escandallo')
          TabOrder = 0
          OnClick = RBSeleccionarClick
        end
        object RGPlantilla: TRadioGroup
          Left = 283
          Top = 33
          Width = 185
          Height = 84
          Caption = 'Plantilla Escandallo'
          Items.Strings = (
            'Oferta'
            'Escandallo')
          TabOrder = 1
          Visible = False
          OnClick = RGPlantillaClick
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 265
    Width = 504
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
  inherited ALMain: TLFActionList
    Left = 400
    Top = 27
    object AOfertesE: TAction
      Caption = 'Abrir Oferta Prod.'
      Hint = 'Abrir oferta de produccion'
      ImageIndex = 96
      OnExecute = AOfertesEExecute
    end
    object AEscandalls: TAction
      Caption = 'Abrir Esc. Prod.'
      Hint = 'Abrir escandallo de produccion'
      ImageIndex = 96
      OnExecute = AEscandallsExecute
    end
  end
end
