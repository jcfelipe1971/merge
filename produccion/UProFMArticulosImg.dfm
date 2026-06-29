inherited ProFMArticulosImg: TProFMArticulosImg
  Left = 442
  Top = 204
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Mantenimiento de Imagenes de Art'#237'culos'
  ClientHeight = 581
  ClientWidth = 800
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 800
    Height = 557
    inherited TBMain: TLFToolBar
      Width = 796
      inherited NavMain: THYMNavigator
        Width = 105
        DataSource = ProDMArticulosImg.DSQMVerArticulos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 105
      end
      inherited EPMain: THYMEditPanel
        Left = 113
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 193
        Visible = False
      end
      inherited TbuttComp: TToolButton
        Left = 201
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 796
      Height = 527
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 788
          Height = 499
          Enabled = True
          inherited G2KTableLoc: TG2KTBLoc
            Left = 4
            Top = 25
            Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBCtrlGridArtImg: TLFDBCtrlGrid
            Left = 0
            Top = 22
            Width = 788
            Height = 477
            Align = alClient
            ColCount = 3
            DataSource = ProDMArticulosImg.DSLstArticulos
            PanelHeight = 238
            PanelWidth = 257
            TabOrder = 0
            RowCount = 2
            OnPaintPanel = DBCtrlGridArtImgPaintPanel
            object Image: TImage
              Left = 13
              Top = 27
              Width = 233
              Height = 200
              Enabled = False
              Proportional = True
            end
            object DBEArticulo: TLFDbedit
              Left = 13
              Top = 3
              Width = 234
              Height = 21
              DataField = 'Articulo'
              DataSource = ProDMArticulosImg.DSLstArticulos
              Enabled = False
              TabOrder = 0
            end
          end
          object LFToolBar1: TLFToolBar
            Left = 0
            Top = 0
            Width = 788
            Height = 22
            AutoSize = True
            EdgeBorders = []
            Flat = True
            HotImages = DMMain.ILMain_In
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object PInfoImagenes: TLFPanel
              Left = 0
              Top = 0
              Width = 789
              Height = 22
              BevelOuter = bvNone
              TabOrder = 0
              object LblFilas: TLFLabel
                Left = 579
                Top = 4
                Width = 21
                Height = 13
                Alignment = taRightJustify
                Caption = 'Filas'
              end
              object LblColumnas: TLFLabel
                Left = 667
                Top = 4
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'Columnas'
              end
              object DBEArtImagen: TLFDbedit
                Left = 0
                Top = 0
                Width = 120
                Height = 21
                Color = clInfoBk
                DataField = 'ARTICULO'
                DataSource = ProDMArticulosImg.DSQMVerArticulos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBETitImagenes: TLFDbedit
                Left = 121
                Top = 0
                Width = 400
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = ProDMArticulosImg.DSQMVerArticulos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object EColumnas: TLFEdit
                Left = 717
                Top = 0
                Width = 30
                Height = 21
                Enabled = False
                TabOrder = 2
                OnChange = NumImagenesChange
              end
              object EFilas: TLFEdit
                Left = 604
                Top = 0
                Width = 30
                Height = 21
                Enabled = False
                TabOrder = 3
                OnChange = NumImagenesChange
              end
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 788
          Height = 499
          DataSource = ProDMArticulosImg.DSQMVerArticulos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 247
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_COSTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ABIERTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VIRTUAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTROL_STOCK'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAIS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_IVA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_COMPRAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_VENTAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_DEVOLUCION_COMPRAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_DEVOLUCION_VENTAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_ABONO_COMPRAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_ABONO_VENTAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTRADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_CORTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DISPONIBILIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTUALIZA_VENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PTO_VERDE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTROLA_MEDIDAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIALIZADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GARANTIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRODUCCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO_3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA_ESCANDALLO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PVP_POR_UD_SECUNDARIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MULTIPLO_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MULTIPLO_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MULTIPLO_3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MULTIPLO_4'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FACTOR_ESCALA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UD_MINIMO_COMPRA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UD_MINIMO_VENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_A'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_C_A'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMAGEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_INTRA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UBICABLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VOLUMEN_UNIT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAMETRO_UNIT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO_UD_SECUNDARIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANTICIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANTICIPO_CONTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANTICIPO_PREG_DATOS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WEB'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FABRICANTE'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 557
    Width = 800
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    FichaEdicion = nil
    FichaExclusiva = nil
    PanelEdicion = nil
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 324
    Top = 4
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
  end
  inherited ALMain: TLFActionList
    Left = 384
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 432
    Top = 16
  end
end
