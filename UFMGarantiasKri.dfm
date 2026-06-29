inherited FMGarantiasKri: TFMGarantiasKri
  Left = 397
  Top = 171
  Caption = 'Garantias'
  ClientHeight = 382
  ClientWidth = 564
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 564
    Height = 201
    inherited TBMain: TLFToolBar
      Width = 560
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        Visible = False
      end
      inherited EPMain: THYMEditPanel
        Width = 37
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 265
      end
      inherited TbuttComp: TToolButton
        Left = 273
      end
      object LReferencia: TLFLabel
        Left = 296
        Top = 0
        Width = 32
        Height = 22
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ref.'
        Layout = tlCenter
      end
      object EFReferencia: TLFEditFind2000
        Left = 328
        Top = 0
        Width = 96
        Height = 22
        TabOrder = 2
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'ID'
        CampoNum = 'REFERENCIA'
        CampoStr = 'ARTICULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS_GARANTIAS_DET'
        Tabla_asociada.DesplegarBusqueda = False
        OnExiste = EFReferenciaExiste
        OrdenadoPor.Strings = (
          'REFERENCIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object TBNuevaReferencia: TToolButton
        Left = 424
        Top = 0
        Hint = 'Crea una nuevo articulo'
        AutoSize = True
        Caption = 'TBNuevaReferencia'
        ImageIndex = 57
        OnClick = TBNuevaReferenciaClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 560
      Height = 171
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 552
          Height = 143
          Enabled = True
          object PCabecera: TLFPanel
            Left = 0
            Top = 0
            Width = 552
            Height = 143
            Align = alClient
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LArticulo: TLFLabel
              Left = 7
              Top = 5
              Width = 35
              Height = 13
              Caption = 'Articulo'
            end
            object LCliente: TLFLabel
              Left = 7
              Top = 45
              Width = 32
              Height = 13
              Caption = 'Cliente'
            end
            object LFecVenta: TLFLabel
              Left = 7
              Top = 85
              Width = 61
              Height = 13
              Caption = 'Fecha Venta'
            end
            object LFecEmbalaje: TLFLabel
              Left = 127
              Top = 85
              Width = 67
              Height = 13
              Caption = 'Fec. Embalaje'
            end
            object LOrdenTrabajo: TLFLabel
              Left = 247
              Top = 85
              Width = 83
              Height = 13
              Caption = 'Orden de Trabajo'
            end
            object ETituloArticulo: TLFEdit
              Left = 119
              Top = 20
              Width = 426
              Height = 21
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 1
            end
            object ECliente: TLFEdit
              Left = 5
              Top = 60
              Width = 113
              Height = 21
              Enabled = False
              TabOrder = 2
              OnChange = EClienteChange
            end
            object ETituloCliente: TLFEdit
              Left = 119
              Top = 60
              Width = 426
              Height = 21
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 3
            end
            object EFecVenta: TLFEdit
              Left = 5
              Top = 100
              Width = 113
              Height = 21
              Enabled = False
              TabOrder = 4
            end
            object EFecEmbalaje: TLFEdit
              Left = 125
              Top = 100
              Width = 113
              Height = 21
              Enabled = False
              TabOrder = 5
            end
            object EOrdenTrabajo: TLFEdit
              Left = 245
              Top = 100
              Width = 113
              Height = 21
              Enabled = False
              TabOrder = 6
            end
            object EFArticulo: TLFEditFind2000
              Left = 5
              Top = 20
              Width = 113
              Height = 21
              TabOrder = 0
              OnChange = EFArticuloChange
              OnExit = EFArticuloExit
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'ARTICULO'
              CampoStr = 'DESCRIPCION'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'ART_ARTICULOS_ESC_GARANTIA'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'ARTICULO')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        TabVisible = False
        inherited DBGMain: THYTDBGrid
          Width = 552
          Height = 143
        end
      end
    end
  end
  inherited TBActions: TLFToolBar [1]
    Top = 358
    Width = 564
  end
  inherited PDetalle: TLFPanel [2]
    Top = 201
    Width = 564
    Height = 157
    inherited TBDetalle: TLFToolBar
      Width = 564
      inherited NavDetalle: THYMNavigator
        DataSource = DMGarantiasKri.DSxGarantias
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 564
      Height = 135
      DataSource = DMGarantiasKri.DSxGarantias
      Transaction = DMGarantiasKri.TUpdate
      ColumnasCheckBoxes.Strings = (
        'MARCA')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      OnRowChange = DBGFDetalleRowChange
      Columns = <
        item
          Expanded = False
          FieldName = 'DETALLE'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Width = 216
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORDEN_TRABAJO'
          Width = 166
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARCA'
          Width = 25
          Visible = True
        end>
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
end
