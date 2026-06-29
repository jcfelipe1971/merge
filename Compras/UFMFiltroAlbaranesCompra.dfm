inherited FMFiltroAlbaranesCompra: TFMFiltroAlbaranesCompra
  Left = 359
  Top = 272
  Width = 620
  Height = 375
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento Filtro Albaranes de Compra'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 610
    Height = 322
    inherited TBMain: TLFToolBar
      Width = 606
      inherited NavMain: THYMNavigator
        Width = 100
        DataSource = DMFiltroAlbaranesCompra.DSQMFiltro
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = ()
        EditaControl = DBEAlbaran
        InsertaControl = DBEAlbaran
      end
      inherited TSepNav: TToolButton
        Left = 100
      end
      inherited EPMain: THYMEditPanel
        Left = 108
        Width = 54
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 162
      end
      inherited TbuttComp: TToolButton
        Left = 170
      end
    end
    inherited PCMain: TLFPageControl
      Width = 606
      Height = 292
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 598
          Height = 264
          object LAlbaran: TLFLabel
            Left = 65
            Top = 40
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Albar'#225'n'
          end
          object Larticulo: TLFLabel
            Left = 64
            Top = 104
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object LDescripcion: TLFLabel
            Left = 45
            Top = 124
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LUnidades: TLFLabel
            Left = 56
            Top = 175
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades'
          end
          object LPrecio: TLFLabel
            Left = 71
            Top = 198
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LLinea: TLFLabel
            Left = 73
            Top = 82
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'L'#237'nea'
          end
          object DBEAlbaran: TLFDbedit
            Left = 307
            Top = 36
            Width = 100
            Height = 21
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = DMFiltroAlbaranesCompra.DSQMFiltro
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object LFFibDBEArticulo: TLFDbedit
            Left = 106
            Top = 99
            Width = 100
            Height = 21
            Color = clInfoBk
            DataField = 'ARTICULO'
            DataSource = DMFiltroAlbaranesCompra.DSQMFiltro
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object LFFibDBETitulo: TLFDbedit
            Left = 106
            Top = 121
            Width = 417
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFiltroAlbaranesCompra.DSQMFiltro
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
          object LFFibDBEUnidades: TLFDbedit
            Left = 106
            Top = 172
            Width = 100
            Height = 21
            Color = clInfoBk
            DataField = 'UNIDADES'
            DataSource = DMFiltroAlbaranesCompra.DSQMFiltro
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object LFFibDBEPrecio: TLFDbedit
            Left = 106
            Top = 194
            Width = 100
            Height = 21
            Color = clInfoBk
            DataField = 'P_COSTE'
            DataSource = DMFiltroAlbaranesCompra.DSQMFiltro
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object LFFibDBELinea: TLFDbedit
            Left = 106
            Top = 77
            Width = 100
            Height = 21
            Color = clInfoBk
            DataField = 'LINEA'
            DataSource = DMFiltroAlbaranesCompra.DSQMFiltro
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBESerie: TLFDbedit
            Left = 206
            Top = 36
            Width = 100
            Height = 21
            Color = clInfoBk
            DataField = 'SERIE'
            DataSource = DMFiltroAlbaranesCompra.DSQMFiltro
            Enabled = False
            ReadOnly = True
            TabOrder = 6
          end
          object DBEEjercicio: TLFDbedit
            Left = 105
            Top = 36
            Width = 100
            Height = 21
            Color = clInfoBk
            DataField = 'EJERCICIO'
            DataSource = DMFiltroAlbaranesCompra.DSQMFiltro
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 598
          Height = 264
          DataSource = DMFiltroAlbaranesCompra.DSQMFiltro
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Title.Caption = 'Albar'#225'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEA'
              Title.Caption = 'Linea'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Title.Caption = 'Art'#237'culo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Title.Caption = 'T'#237'tulo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Title.Caption = 'Unidades'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Title.Caption = 'Almacen'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES_PENDIENTES'
              Title.Caption = 'Unid.Ptes.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Title.Caption = 'Precio'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO'
              Title.Caption = 'Dto.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO_2'
              Title.Caption = 'Dto.2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO_3'
              Title.Caption = 'Dto.3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_COSTE'
              Title.Caption = 'P.Coste'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAIS'
              Title.Caption = 'Pa'#237's'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_IVA'
              Title.Caption = 'Tipo IVA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_IVA'
              Title.Caption = 'P.IVA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_RECARGO'
              Title.Caption = 'P.Recargo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BRUTO'
              Title.Caption = 'Bruto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'I_DESCUENTO'
              Title.Caption = 'I.Dto.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'B_IMPONIBLE'
              Title.Caption = 'B.Imponible'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'B_DTO_LINEA'
              Title.Caption = 'B.Dto.Linea'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'C_IVA'
              Title.Caption = 'C.IVA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'C_RECARGO'
              Title.Caption = 'C.Recargo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'T_COSTE'
              Title.Caption = 'T.Coste'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'M_BRUTO'
              Title.Caption = 'M.Bruto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIQUIDO'
              Title.Caption = 'Liquido'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTRADA'
              Title.Caption = 'Entrada'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'M_MOV_STOCK'
              Title.Caption = 'M.Mov.Stock'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES_EXT'
              Title.Caption = 'Unid.Ext.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTAS'
              Title.Caption = 'Notas'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_A'
              Title.Caption = 'Id.A'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_C_A'
              Title.Caption = 'Id.C.A.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_E'
              Title.Caption = 'Id.E'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_DETALLES_E'
              Title.Caption = 'Id.Detalles.E'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PRE_DET'
              Title.Caption = 'Fecha.Pre.Det'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REC_DET'
              Title.Caption = 'Fecha.Rec.Det'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUPLIDO'
              Title.Caption = 'Suplido'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSERIE'
              Title.Caption = 'NSerie'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 322
    Width = 610
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
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    object AAbrirAlbaran: TAction
      Caption = 'Abrir Albaran'
      Hint = 'Abrir Albaran'
      ImageIndex = 60
      OnExecute = AAbrirAlbaranExecute
    end
  end
end
