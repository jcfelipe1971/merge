inherited ProFMRelOfertesV: TProFMRelOfertesV
  Left = 512
  Top = 187
  BorderStyle = bsDialog
  Caption = 'Relaci'#243'n con ofertas de escandallo'
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
        Hint = 'Generar oferta'
        ImageIndex = 72
        ParentShowHint = False
        ShowHint = True
        OnClick = TBGenerarClick
      end
    end
    object PnlBuscar: TLFPanel
      Left = 2
      Top = 28
      Width = 500
      Height = 216
      Align = alClient
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object LblBusca: TLFLabel
        Left = 32
        Top = 162
        Width = 158
        Height = 13
        Caption = 'Buscar plantilla para oferta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblPlantilla: TLFLabel
        Left = 33
        Top = 195
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Plantilla'
      end
      object EFSelecc: TEditFind2000
        Left = 74
        Top = 191
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
        Left = 200
        Top = 191
        Width = 280
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ProDMRelOfertesV.DSEscandallo
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
        Left = 128
        Top = 191
        Width = 71
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'COMPUESTO'
        DataSource = ProDMRelOfertesV.DSEscandallo
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
          Caption = 'Seleccionar tipo creaci'#243'n oferta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RBSeleccionar: TRadioGroup
          Left = 24
          Top = 41
          Width = 185
          Height = 75
          Caption = 'Tipo Oferta'
          Items.Strings = (
            'Crear nueva oferta'
            'Seleccionar oferta plantilla')
          TabOrder = 0
          OnClick = RBSeleccionarClick
        end
        object RGPlantilla: TRadioGroup
          Left = 269
          Top = 41
          Width = 185
          Height = 75
          Caption = 'Plantilla Oferta'
          Items.Strings = (
            'Oferta'
            'Escandallo')
          TabOrder = 1
          Visible = False
          OnClick = RGPlantillaClick
        end
      end
    end
    object BarraEstat: TStatusBar
      Left = 2
      Top = 244
      Width = 500
      Height = 19
      Panels = <
        item
          Bevel = pbNone
          Width = 50
        end>
      SimplePanel = False
      Visible = False
    end
  end
  inherited TBActions: TLFToolBar
    Top = 265
    Width = 504
  end
  inherited CEMain: TControlEdit
    Left = 355
    Top = 21
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 391
    Top = 21
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
    Left = 426
    Top = 21
    object AOfertesE: TAction
      Caption = 'AOfertesE'
      Visible = False
      OnExecute = AOfertesEExecute
    end
    object AEscandalls: TAction
      Caption = 'AEscandalls'
      Visible = False
      OnExecute = AEscandallsExecute
    end
    object AOfertasEsp: TAction
      Caption = 'AOfertasEsp'
      Visible = False
      OnExecute = AOfertasEspExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 462
    Top = 21
  end
end
