inherited ZFMTiposArticulo: TZFMTiposArticulo
  Left = 407
  Top = 225
  Caption = 'Tipos Art'#237'culo'
  ClientHeight = 231
  ClientWidth = 410
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 410
    Height = 207
    inherited TBMain: TLFToolBar
      Width = 406
      inherited NavMain: THYMNavigator
        Width = 160
        DataSource = ZDMTiposArticulo.DSQMTiposArticulo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 160
      end
      inherited EPMain: THYMEditPanel
        Left = 168
        Width = 78
        DataSource = ZDMTiposArticulo.DSQMTiposArticulo
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 248
      end
      inherited TbuttComp: TToolButton
        Left = 256
      end
    end
    inherited PCMain: TLFPageControl
      Width = 406
      Height = 177
      ActivePage = TSSubtipos
      TabIndex = 2
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 398
          Height = 149
          inherited G2KTableLoc: TG2KTBLoc
            Left = 67
            Top = 48
            DataSource = ZDMTiposArticulo.DSQMTiposArticulo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TIPOS_ARTICULO_TYC'
            CampoNum = 'TIPO_ARTICULO_TYC'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'TIPO_ARTICULO_TYC')
          end
          object LbId: TLFLabel
            Left = 59
            Top = 33
            Width = 9
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id'
          end
          object LbDesc: TLFLabel
            Left = 12
            Top = 55
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LbCadenaInicio: TLFLabel
            Left = 3
            Top = 75
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cadena Inicio'
          end
          object LFDesc: TLFDbedit
            Left = 74
            Top = 51
            Width = 321
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ZDMTiposArticulo.DSQMTiposArticulo
            TabOrder = 1
          end
          object LFId: TLFDbedit
            Left = 74
            Top = 29
            Width = 37
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIPO_ARTICULO_TYC'
            DataSource = ZDMTiposArticulo.DSQMTiposArticulo
            TabOrder = 0
            OnChange = LFIdChange
          end
          object LFCadInicio: TLFDbedit
            Left = 74
            Top = 73
            Width = 121
            Height = 21
            DataField = 'CADENA_INICIO'
            DataSource = ZDMTiposArticulo.DSQMTiposArticulo
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 398
          Height = 149
          DataSource = ZDMTiposArticulo.DSQMTiposArticulo
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_ARTICULO_TYC'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 258
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CADENA_INICIO'
              Visible = True
            end>
        end
      end
      object TSSubtipos: TTabSheet
        Caption = 'Subtipos'
        ImageIndex = 2
        object TBSubtipo: TLFToolBar
          Left = 0
          Top = 0
          Width = 398
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavSubtipo: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = ZDMTiposArticulo.DSSubtipoArticulo
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFSubtipo: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 398
          Height = 127
          Align = alClient
          DataSource = ZDMTiposArticulo.DSSubtipoArticulo
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = False
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 0
          IndiceBitmapChecked = -1
          IndiceBitmapDescendente = 0
          BaseDeDatos = DMMain.DataBase
          Transaction = ZDMTiposArticulo.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clWindow
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'SUBTIPO_ARTICULO_TYC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 319
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 207
    Width = 410
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
  end
end
