inherited FMSincronizacionTiendaMasYMasBarato: TFMSincronizacionTiendaMasYMasBarato
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'FMSincronizacionTiendaMasYMasBarato'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      object NavMain: THYMNavigator [0]
        Left = 0
        Top = 0
        Width = 128
        Height = 22
        DataSource = DMSincronizacionTiendaMasYMasBarato.DSQMConfPrestaShop
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object ToolButton1: TToolButton [1]
        Left = 128
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 136
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PNLConfiguracionSincronizacion: TLFPanel
      Left = 2
      Top = 28
      Width = 498
      Height = 141
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        498
        141)
      object LAlmacen: TLFLabel
        Left = 58
        Top = 27
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Almacen'
      end
      object LFormaPago: TLFLabel
        Left = 45
        Top = 49
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'FormaPago'
      end
      object LSerie: TLFLabel
        Left = 74
        Top = 71
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
      end
      object LConexion: TLFLabel
        Left = 55
        Top = 5
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Conexion'
      end
      object LUltimaFactura: TLFLabel
        Left = 7
        Top = 115
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ultima Factura Imp.'
      end
      object LAgente: TLFLabel
        Left = 65
        Top = 93
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'Agente'
      end
      object DBEAlmacen: TLFDbedit
        Left = 104
        Top = 24
        Width = 121
        Height = 21
        DataField = 'ALMACEN'
        DataSource = DMSincronizacionTiendaMasYMasBarato.DSQMConfPrestaShop
        TabOrder = 1
      end
      object DBEFormaPago: TLFDbedit
        Left = 104
        Top = 46
        Width = 121
        Height = 21
        DataField = 'FORMA_PAGO'
        DataSource = DMSincronizacionTiendaMasYMasBarato.DSQMConfPrestaShop
        TabOrder = 2
      end
      object DBESerie: TLFDbedit
        Left = 104
        Top = 68
        Width = 121
        Height = 21
        DataField = 'SERIE'
        DataSource = DMSincronizacionTiendaMasYMasBarato.DSQMConfPrestaShop
        TabOrder = 3
      end
      object DBEConexion: TLFDbedit
        Left = 104
        Top = 2
        Width = 353
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DSN'
        DataSource = DMSincronizacionTiendaMasYMasBarato.DSQMConfPrestaShop
        TabOrder = 0
      end
      object DBEUltimaFactura: TLFDbedit
        Left = 104
        Top = 112
        Width = 121
        Height = 21
        DataField = 'ULT_FACTURA'
        DataSource = DMSincronizacionTiendaMasYMasBarato.DSQMConfPrestaShop
        TabOrder = 5
      end
      object DBEAgente: TLFDbedit
        Left = 104
        Top = 90
        Width = 121
        Height = 21
        DataField = 'AGENTE'
        DataSource = DMSincronizacionTiendaMasYMasBarato.DSQMConfPrestaShop
        TabOrder = 4
      end
    end
    object MLog: TLFMemo
      Left = 2
      Top = 169
      Width = 498
      Height = 161
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 2
    end
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
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
    end
    object ASincronizar: TAction
      Category = 'Procesos'
      Caption = 'Sincronizar'
      OnExecute = ASincronizarExecute
    end
  end
end
