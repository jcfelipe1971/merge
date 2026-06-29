inherited FMCaravanas: TFMCaravanas
  Left = 456
  Top = 130
  Caption = 'Caravanas'
  ClientHeight = 488
  ClientWidth = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 509
    Height = 464
    inherited TBMain: TLFToolBar
      Width = 505
      inherited NavMain: THYMNavigator
        DataSource = DMCaravanas.DSxCaravana
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        DataSource = DMCaravanas.DSxCaravana
        VisibleButtons = [neImprime, neReport, neSalir]
        Hints.Strings = ()
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Left = 306
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Left = 314
        Hint = 'Imprimir'
        ImageIndex = 14
        Visible = True
        OnClick = TbuttCompClick
      end
      object TButtBorraFiltro: TToolButton
        Left = 337
        Top = 0
        Hint = 'Borra Filtros'
        Caption = 'Borra Filtro'
        ImageIndex = 27
        OnClick = TButtBorraFiltroClick
      end
    end
    inherited PCMain: TLFPageControl
      Top = 69
      Width = 505
      Height = 393
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 497
          Height = 365
          inherited G2KTableLoc: TG2KTBLoc
            Left = 101
            Top = 36
          end
          object LNroPedido: TLFLabel
            Left = 68
            Top = 12
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Pedido'
          end
          object LCliente: TLFLabel
            Left = 92
            Top = 34
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LFechaEnvioSolicitado: TLFLabel
            Left = 52
            Top = 144
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Envio Sol.'
          end
          object LFechaRecepcion: TLFLabel
            Left = 39
            Top = 166
            Width = 85
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Recepcion'
          end
          object LModelo: TLFLabel
            Left = 89
            Top = 56
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modelo'
          end
          object LAnyo: TLFLabel
            Left = 105
            Top = 100
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'A'#241'o'
          end
          object LNroPedidoHobby: TLFLabel
            Left = 45
            Top = 122
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Ped. Hobby'
          end
          object LNroOrdenConf: TLFLabel
            Left = 268
            Top = 122
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Orden Conf.'
          end
          object LFechaPrevistaEntrega: TLFLabel
            Left = 259
            Top = 144
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Prev. Entrega'
          end
          object LFechaEntrega: TLFLabel
            Left = 287
            Top = 166
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Entrega'
          end
          object LBastidor: TLFLabel
            Left = 86
            Top = 78
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bastidor'
          end
          object LNroFacturaHobby: TLFLabel
            Left = 46
            Top = 188
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Fac. Hobby'
          end
          object LImporte: TLFLabel
            Left = 313
            Top = 188
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
          end
          object LPlan: TLFLabel
            Left = 103
            Top = 210
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Plan'
          end
          object LAccesorios: TLFLabel
            Left = 32
            Top = 232
            Width = 52
            Height = 13
            Caption = 'Accesorios'
          end
          object DBEPedido: TLFDbedit
            Left = 128
            Top = 8
            Width = 97
            Height = 21
            DataField = 'PEDIDO'
            DataSource = DMCaravanas.DSxCaravana
            TabOrder = 0
          end
          object DBEAno: TLFDbedit
            Left = 128
            Top = 96
            Width = 97
            Height = 21
            DataField = 'ANO'
            DataSource = DMCaravanas.DSxCaravana
            TabOrder = 4
          end
          object DBENroRHobby: TLFDbedit
            Left = 128
            Top = 118
            Width = 97
            Height = 21
            DataField = 'PEDIDO_HOBBY'
            DataSource = DMCaravanas.DSxCaravana
            TabOrder = 5
          end
          object DBENroOrdenConf: TLFDbedit
            Left = 352
            Top = 118
            Width = 97
            Height = 21
            DataField = 'ORDEN_CONF'
            DataSource = DMCaravanas.DSxCaravana
            TabOrder = 6
          end
          object DBEImporte: TLFDbedit
            Left = 352
            Top = 184
            Width = 97
            Height = 21
            DataField = 'IMPORTE'
            DataSource = DMCaravanas.DSxCaravana
            TabOrder = 12
          end
          object DBEPlan: TLFDbedit
            Left = 128
            Top = 206
            Width = 97
            Height = 21
            DataField = 'PLAN_PAGO'
            DataSource = DMCaravanas.DSxCaravana
            TabOrder = 13
          end
          object DBEBastidor: TLFDbedit
            Left = 128
            Top = 74
            Width = 97
            Height = 21
            DataField = 'BASTIDOR'
            DataSource = DMCaravanas.DSxCaravana
            TabOrder = 3
          end
          object DBENroFacHobby: TLFDbedit
            Left = 128
            Top = 184
            Width = 97
            Height = 21
            DataField = 'FACTURA'
            DataSource = DMCaravanas.DSxCaravana
            TabOrder = 11
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 128
            Top = 30
            Width = 97
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DMCaravanas.DSxCaravana
            TabOrder = 1
            OnChange = DBEFClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'cliente')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDEFecEnvioSol: TLFDBDateEdit
            Left = 128
            Top = 140
            Width = 97
            Height = 21
            DataField = 'FECHA_ENVIO_PED'
            DataSource = DMCaravanas.DSxCaravana
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 7
          end
          object DBDEFecRecepcionSol: TLFDBDateEdit
            Left = 128
            Top = 162
            Width = 97
            Height = 21
            DataField = 'FECHA_ENTREGA'
            DataSource = DMCaravanas.DSxCaravana
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 9
          end
          object DBDEFecPrevEntrega: TLFDBDateEdit
            Left = 352
            Top = 140
            Width = 97
            Height = 21
            DataField = 'FECHA_PREV_ENTREGA'
            DataSource = DMCaravanas.DSxCaravana
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 8
          end
          object DBDEFecEntrega: TLFDBDateEdit
            Left = 352
            Top = 162
            Width = 97
            Height = 21
            DataField = 'FECHA_ENTREGA'
            DataSource = DMCaravanas.DSxCaravana
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 10
          end
          object DBEFModelo: TLFDBEditFind2000
            Left = 128
            Top = 52
            Width = 97
            Height = 21
            DataField = 'MODELO'
            DataSource = DMCaravanas.DSxCaravana
            TabOrder = 2
            OnChange = DBEFModeloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'articulo')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBMAccesorios: TLFDBMemo
            Left = 32
            Top = 248
            Width = 449
            Height = 114
            DataField = 'ACCESORIOS'
            DataSource = DMCaravanas.DSxCaravana
            TabOrder = 14
          end
          object ECliente: TLFEdit
            Left = 226
            Top = 30
            Width = 259
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 15
          end
          object EModelo: TLFEdit
            Left = 226
            Top = 52
            Width = 259
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 16
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 497
          Height = 365
          DataSource = DMCaravanas.DSxCaravana
          Columns = <
            item
              Expanded = False
              FieldName = 'PEDIDO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENVIO_PED'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RECEPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODELO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PEDIDO_HOBBY'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN_CONF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PREV_ENTREGA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENTREGA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BASTIDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FACTURA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLAN_PAGO'
              Visible = True
            end>
        end
      end
    end
    object PFiltros: TLFPanel
      Left = 2
      Top = 28
      Width = 505
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LFiltroPedido: TLFLabel
        Left = 3
        Top = 2
        Width = 73
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Pedido'
      end
      object LFiltroCliente: TLFLabel
        Left = 77
        Top = 2
        Width = 73
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Cliente'
      end
      object LFiltroModelo: TLFLabel
        Left = 151
        Top = 2
        Width = 73
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Modelo'
      end
      object LFiltroBastidor: TLFLabel
        Left = 225
        Top = 2
        Width = 73
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Bastidor'
      end
      object LFiltroFacturaHobby: TLFLabel
        Left = 299
        Top = 2
        Width = 73
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Fac. Hobby'
      end
      object EFilPedido: TLFEdit
        Left = 3
        Top = 16
        Width = 73
        Height = 21
        TabOrder = 0
        OnChange = Filtra
      end
      object EFilCliente: TLFEdit
        Left = 77
        Top = 16
        Width = 73
        Height = 21
        TabOrder = 1
        OnChange = Filtra
      end
      object EFilBastidor: TLFEdit
        Left = 225
        Top = 16
        Width = 73
        Height = 21
        TabOrder = 3
        OnChange = Filtra
      end
      object EFilModelo: TLFEdit
        Left = 151
        Top = 16
        Width = 73
        Height = 21
        TabOrder = 2
        OnChange = Filtra
      end
      object EFilFacHobby: TLFEdit
        Left = 299
        Top = 16
        Width = 73
        Height = 21
        TabOrder = 4
        OnChange = Filtra
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 464
    Width = 509
  end
  inherited CEMain: TControlEdit
    Left = 308
    Top = 284
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 344
    Top = 296
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 366
    Top = 170
  end
end
